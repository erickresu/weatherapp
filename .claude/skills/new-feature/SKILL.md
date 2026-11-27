---
name: new-feature
description: Scaffold a new clean-architecture feature in this Flutter app (domain/data/presentation layers, Bloc, DI registration, route, tests and a docs/features spec). Use when the user asks to create, add, start or scaffold a feature, module or screen backed by an API.
argument-hint: <feature_name> [endpoint] [what it does]
---

# New feature

Arguments: `$ARGUMENTS` (first word is the feature name; optional endpoint path; optional description).

## 1. Name and spec

1. Convert the feature name to snake_case (`user_profile`). Class prefix is PascalCase (`UserProfile`).
2. Read `docs/architecture.md`.
3. Look for `docs/features/<feature>.md`.
   - If it exists, follow it (entity fields, endpoint, states, edge cases).
   - If it does not, create it from `docs/templates/feature.md` with what the user told you, and ask the user to confirm anything you had to guess (endpoint, response fields, screens) before going past step 2. If the user said to just scaffold, continue with placeholders and list them at the end.

## 2. Generate the skeleton

Run from the repo root:

```bash
.claude/skills/new-feature/scaffold.sh <feature> [endpoint]
```

It renders the templates in `templates/` into:

```
lib/features/<feature>/
  domain/entities/<feature>_entity.dart
  domain/repositories/<feature>_repository.dart
  domain/usecases/get_<feature>.dart
  data/models/<feature>_model.dart                (freezed + json)
  data/datasources/<feature>_remote_data_source.dart
  data/repositories/<feature>_repository_impl.dart
  presentation/bloc/<feature>_bloc.dart (+ _event, _state)
  presentation/pages/<feature>_page.dart
test/features/<feature>/
  data/repositories/<feature>_repository_impl_test.dart
  presentation/bloc/<feature>_bloc_test.dart
```

It refuses to overwrite an existing feature folder. If the feature exists already, extend it by hand instead.

## 3. Fill in the real feature

The skeleton has a single `id` field and one `get<Feature>` call. Replace them with the spec:

- Entity and model fields (model maps to entity in `toEntity()`).
- Data source method(s), HTTP verb, path, request body.
- Use case(s): one class per action (`Get…`, `Create…`, `Update…`), each with `call()`.
- Bloc events/states for every action; keep states `sealed` / `final` and `Equatable`.
- Page UI per the spec's screens.
- Keep the layer rules from `CLAUDE.md` (no `data` or Flutter imports in `domain`; repositories return `Either<Failure, T>`).

## 4. Wire it up

- Route: add a constant to `lib/core/constants/routes/routes_name.dart` and a case to `lib/core/constants/routes/app_router.dart` returning `MaterialPageRoute(builder: (_) => const <Feature>Page())`.
- DI is automatic through the `@injectable` / `@LazySingleton` annotations.

## 5. Verify

```bash
dart run build_runner build -d
flutter analyze
flutter test
```

All three must pass. Fix failures before reporting. Update the tests so they cover every new use case and bloc event (success and error).

## 6. Finish

- Update `docs/features/<feature>.md` (status, final API, states, anything that changed).
- Update `README.md` if the feature changes setup, commands or the feature list.
- Report: files created, placeholders still left, and anything the user must decide.
