#!/usr/bin/env bash
# Stop hook: if code/config changed but README.md did not, ask Claude (once) to
# update the README or say why it does not need to.
#
# - Fires at most once per stop (respects stop_hook_active).
# - Fires at most once per distinct set of changes: the hash of the current
#   code diff is remembered in .git/, so a "no README change needed" answer is
#   not asked again until the code changes again.

input=$(cat)

# Already continuing because of this hook: let Claude stop.
if printf '%s' "$input" | grep -q '"stop_hook_active"[[:space:]]*:[[:space:]]*true'; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-.}" 2>/dev/null || exit 0
git rev-parse --git-dir >/dev/null 2>&1 || exit 0

watched=(pubspec.yaml lib android ios .claude .mcp.json analysis_options.yaml)

changed=$(git status --porcelain -- "${watched[@]}" 2>/dev/null)
[ -z "$changed" ] && exit 0

# README already touched in this working tree: nothing to ask.
if [ -n "$(git status --porcelain -- README.md 2>/dev/null)" ]; then
  exit 0
fi

state_file="$(git rev-parse --git-dir)/claude-readme-check"
hash=$({ git diff HEAD -- "${watched[@]}"; git ls-files --others --exclude-standard -- "${watched[@]}"; } 2>/dev/null | shasum | cut -d' ' -f1)

if [ -f "$state_file" ] && [ "$(cat "$state_file")" = "$hash" ]; then
  exit 0
fi
printf '%s' "$hash" > "$state_file"

cat <<'EOF'
{"decision": "block", "reason": "Code or config changed but README.md did not. If the change affects setup, commands, dependencies, flavors, folder structure, features or the AI tooling, update the matching README.md sections now. If it does not, reply in one short line saying why no README update is needed."}
EOF
exit 0
