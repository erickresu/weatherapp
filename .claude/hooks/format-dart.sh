#!/usr/bin/env bash
# PostToolUse hook: run `dart format` on a .dart file Claude just wrote or edited.
# Reads the hook payload (JSON) on stdin.

file=$(jq -r '.tool_response.filePath // .tool_input.file_path // empty')

case "$file" in
  *.dart) dart format "$file" >/dev/null ;;
esac

exit 0
