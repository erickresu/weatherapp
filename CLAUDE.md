# CLAUDE.md

Flutter clean architecture template. Package name: `try_ko_ulit_clean_arch`.

## Stack

- State management: `flutter_bloc` (Bloc/Cubit) + `equatable`
- DI: `get_it` + `injectable` (code generated)
- Networking: `dio` + `pretty_dio_logger`
- Models: `freezed` + `json_serializable` (code generated)
- Error handling: `dartz` `Either<Failure, T>` returned from repositories
- Secure storage: `flutter_secure_storage` (tokens)
- Logging: `LoggerUtils` in `lib/core/utils/logger.dart` — use it, not `print`

## Layout

```
lib/
  app.dart                  # runAppWithFlavor(), MyApp
  main.dart / main_test.dart / main_prod.dart   # flavor entry points
  core/
    constants/network/      # ApiConstants, FlavorConfig
    constants/routes/       # RouteNames, AppRouter (onGenerateRoute)
    di/                     # injection.dart, CoreModule, injection.config.dart (generated)
    error/                  # Failure
    model/                  # shared entities/models
    utils/                  # logger, loading indicator
  features/<feature>/
    data/                   # datasources, models (DTOs), repository implementations
    domain/                 # entities, repository interfaces, use cases
    presentation/           # blocs, pages, widgets
```

Dependency rule: `presentation` depends on `domain`; `data` depends on `domain`; `domain` depends on nothing in Flutter or `data`.

## Conventions

- Register classes with `@injectable` / `@lazySingleton` / `@LazySingleton(as: Interface)`; never register by hand in `injection.config.dart`.
- Repositories return `Either<Failure, T>`; blocs fold the result into states.
- Models map to entities with `toEntity()`; entities never know about JSON.
- New routes: add a constant to `RouteNames` and a case to `AppRouter.onGenerateRoute`.
- Freezed 3+ classes must be declared `abstract class` or `sealed class` with the `with _$Name` mixin.
- Use relative imports inside `lib/` (keeps the template renamable).

## Workflow

- New feature: use the `/new-feature` skill (`.claude/skills/new-feature/`); it scaffolds every layer, tests and the spec note.
- Non-trivial change: ask the `planner` agent for a spec and plan first.
- After building: use the `test-writer` agent for tests, then the `arch-reviewer` agent before reporting done.
- Done means `dart run build_runner build -d`, `flutter analyze` and `flutter test` all pass.
- Use the `dart` MCP server tools (analyzer errors, tests, hot reload, pub.dev search) when available.

## Testing

- `test/` mirrors `lib/`. Mock with `mocktail`.
- `bloc_test` is not installed (conflicts with freezed 4). Test blocs with `expectLater(bloc.stream, emitsInOrder([...]))`.
- Unit tests never hit the network or `getIt`.

## README

Keep `README.md` current without being asked. When a change affects setup, commands, dependencies, flavors, folder structure, features or the AI tooling (`.claude/`, `.mcp.json`, `CLAUDE.md`), update the matching README sections in the same task. A Stop hook reminds you once if code changed and README did not.

## Docs (`docs/`, also an Obsidian vault)

- Before building a feature, read `docs/architecture.md` and the feature's spec in `docs/features/` if one exists.
- New feature with no spec: create `docs/features/<feature>.md` from `docs/templates/feature.md` first and confirm it with the user.
- After finishing, update the feature note (status, API, states, anything that changed).
- A choice someone might later question goes in `docs/decisions/NNNN-<slug>.md` from `docs/templates/decision.md`.
- Use relative Markdown links (`[text](path.md)`), not `[[wikilinks]]`, so notes render on GitHub too.

## Commands

```bash
flutter pub get
dart run build_runner build -d          # regenerate DI, freezed, json code
dart run build_runner watch -d          # regenerate on save
flutter analyze
flutter test
flutter run --flavor dev -t lib/main_test.dart    # test backend (Android)
flutter run --flavor prod -t lib/main_prod.dart   # prod backend (Android)
flutter run -t lib/main_test.dart                 # iOS has no flavor schemes yet
```

## Do not

- Do not edit generated files: `*.config.dart`, `*.g.dart`, `*.freezed.dart`. Change the source and rerun `build_runner`.
- Do not put API keys or secrets in the app source. Keys for third-party APIs (including AI providers) belong on a backend.
