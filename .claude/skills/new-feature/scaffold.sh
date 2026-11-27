#!/usr/bin/env bash
# Scaffold a clean-architecture feature from the templates next to this script.
#
# Usage: scaffold.sh <feature_snake_case> [endpoint]
#   scaffold.sh user_profile users/me
#
# Creates lib/features/<feature>/... and test/features/<feature>/...
# Refuses to overwrite an existing feature folder.

set -euo pipefail

feature="${1:?usage: scaffold.sh <feature_snake_case> [endpoint]}"
endpoint="${2:-$feature}"

if [[ ! "$feature" =~ ^[a-z][a-z0-9_]*$ ]]; then
  echo "feature must be snake_case (e.g. user_profile), got: $feature" >&2
  exit 1
fi

root="$(git rev-parse --show-toplevel)"
templates="$(cd "$(dirname "$0")/templates" && pwd)"
package="$(sed -n 's/^name:[[:space:]]*//p' "$root/pubspec.yaml" | head -1)"
pascal="$(echo "$feature" | awk -F_ '{for (i = 1; i <= NF; i++) printf "%s%s", toupper(substr($i, 1, 1)), substr($i, 2)}')"

lib="$root/lib/features/$feature"
test="$root/test/features/$feature"

if [ -e "$lib" ]; then
  echo "lib/features/$feature already exists; not overwriting." >&2
  exit 1
fi

render() { # render <template> <destination>
  mkdir -p "$(dirname "$2")"
  sed -e "s/__Feature__/$pascal/g" \
      -e "s/__feature__/$feature/g" \
      -e "s#__endpoint__#$endpoint#g" \
      -e "s/__package__/$package/g" \
      "$templates/$1" > "$2"
  echo "created ${2#"$root"/}"
}

render lib/entity.dart.tmpl             "$lib/domain/entities/${feature}_entity.dart"
render lib/repository.dart.tmpl         "$lib/domain/repositories/${feature}_repository.dart"
render lib/usecase.dart.tmpl            "$lib/domain/usecases/get_${feature}.dart"
render lib/model.dart.tmpl              "$lib/data/models/${feature}_model.dart"
render lib/remote_data_source.dart.tmpl "$lib/data/datasources/${feature}_remote_data_source.dart"
render lib/repository_impl.dart.tmpl    "$lib/data/repositories/${feature}_repository_impl.dart"
render lib/bloc.dart.tmpl               "$lib/presentation/bloc/${feature}_bloc.dart"
render lib/event.dart.tmpl              "$lib/presentation/bloc/${feature}_event.dart"
render lib/state.dart.tmpl              "$lib/presentation/bloc/${feature}_state.dart"
render lib/page.dart.tmpl               "$lib/presentation/pages/${feature}_page.dart"
render test/repository_impl_test.dart.tmpl "$test/data/repositories/${feature}_repository_impl_test.dart"
render test/bloc_test.dart.tmpl            "$test/presentation/bloc/${feature}_bloc_test.dart"

echo
echo "Class prefix: $pascal. Next: add the route, run build_runner, analyze and test."
