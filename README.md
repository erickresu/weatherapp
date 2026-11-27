# Flutter Clean Architecture Template

Starting point for new Flutter apps: clean architecture, Bloc, generated dependency injection, flavors, and an AI-ready setup for Claude Code (project rules, MCP server, feature scaffold, review/test agents, and a docs vault that also opens in Obsidian).

## Requirements

- Flutter 3.47+ (Dart 3.13+)
- Android: JDK 17 or newer (the JDK bundled with current Android Studio works). Toolchain: Gradle 9.3.1, AGP 9.1.0, Kotlin 2.4.0, Java 17 target.
- iOS: Xcode with iOS 15.0+ deployment target.

## Getting started

```bash
flutter pub get
dart run build_runner build -d
flutter run --flavor dev -t lib/main_test.dart
```

### Flavors

| Flavor | Entry point | Android | iOS | Backend |
| --- | --- | --- | --- | --- |
| test | `lib/main_test.dart` (also `lib/main.dart`) | `--flavor dev` | no flavor (`-t lib/main_test.dart`) | test URL |
| prod | `lib/main_prod.dart` | `--flavor prod` | no flavor (`-t lib/main_prod.dart`) | prod URL |

Base URLs live in `lib/core/constants/network/api_constants.dart`. Android product flavors are defined in `android/app/build.gradle.kts`; iOS has no flavor schemes yet, so pass only `-t` on iOS.

### Starting a new app from this template

1. Rename the package: change `name:` in `pubspec.yaml` and replace `package:try_ko_ulit_clean_arch/` in `lib/` and `test/`.
2. Android: update `namespace` and `applicationId` in `android/app/build.gradle.kts`, and move `MainActivity.kt` to the matching package folder.
3. iOS: update `PRODUCT_BUNDLE_IDENTIFIER` in Xcode (Runner target).
4. Set real base URLs in `ApiConstants`.
5. Replace this README's title and intro with the app's own.

## Commands

```bash
dart run build_runner build -d   # regenerate DI, freezed and json code
dart run build_runner watch -d   # regenerate on save
flutter analyze
flutter test
flutter build apk --flavor dev -t lib/main_test.dart
```

## Project structure

```
lib/
  app.dart                     runAppWithFlavor(), MyApp
  main.dart, main_test.dart, main_prod.dart
  core/
    constants/network/         ApiConstants, FlavorConfig
    constants/routes/          RouteNames, AppRouter
    di/                        get_it + injectable setup (injection.config.dart is generated)
    error/                     Failure
    model/                     shared entities/models
    utils/                     LoggerUtils, loading dialog
  features/<feature>/
    data/                      models, data sources, repository implementations
    domain/                    entities, repository interfaces, use cases
    presentation/              blocs, pages, widgets
test/                          mirrors lib/
docs/                          architecture, decisions, feature specs (Obsidian vault)
```

Details: [docs/architecture.md](docs/architecture.md).

## Stack

| Concern | Package |
| --- | --- |
| State management | `flutter_bloc` 9, `equatable` 3 |
| Dependency injection | `get_it` 9, `injectable` 3 (+ `injectable_generator`) |
| Networking | `dio` 5, `pretty_dio_logger` |
| Models | `freezed` 4 / `freezed_annotation` 3, `json_serializable` |
| Errors | `dartz` (`Either<Failure, T>`) |
| Storage | `flutter_secure_storage` 11 |
| QR scanning | `mobile_scanner` 7 |
| UI helpers | `google_fonts`, `flutter_screenutil`, `flutter_spinkit` |
| Logging | `logger` 2 via `LoggerUtils` |
| Testing | `flutter_test`, `mocktail` |

`bloc_test` is not included: it currently conflicts with `freezed` 4 over the `analyzer` version. Bloc tests use `expectLater(bloc.stream, emitsInOrder([...]))` instead.

## Docs (and Obsidian)

`docs/` holds the project's notes: architecture, decision records and one spec per feature, plus templates for new notes. It is plain Markdown; optionally open the `docs/` folder in [Obsidian](https://obsidian.md) as a vault. See [docs/README.md](docs/README.md).

## AI setup (Claude Code)

| File | What it does |
| --- | --- |
| `CLAUDE.md` | Project rules Claude reads every session: stack, layout, conventions, commands, docs and README rules. |
| `.mcp.json` | Dart & Flutter MCP server (`dart mcp-server`): live analyzer errors, tests, hot reload, pub.dev search. Approve it once when Claude Code asks. |
| `.claude/settings.json` | Pre-approved safe commands (analyze, test, format, build_runner), plus hooks. |
| `.claude/hooks/format-dart.sh` | Runs `dart format` on every Dart file Claude writes or edits. |
| `.claude/hooks/readme-check.sh` | When Claude finishes and code changed but `README.md` did not, asks it once to update the README or say why not. |
| `.claude/skills/new-feature/` | `/new-feature <name> [endpoint]`: scaffolds a full feature (all layers, Bloc, DI, tests, spec note) and verifies it builds. |
| `.claude/agents/planner.md` | Read-only agent that turns a request into a feature spec and step-by-step plan. |
| `.claude/agents/test-writer.md` | Writes and runs repository, use case and bloc tests. |
| `.claude/agents/arch-reviewer.md` | Read-only review of changes against the clean-architecture rules. |

Typical flow: describe the feature, let `planner` draft `docs/features/<feature>.md`, run `/new-feature <feature>`, then ask for `test-writer` and `arch-reviewer`.

Hooks and agents load when a Claude Code session starts; after pulling changes to `.claude/`, restart the session or open `/hooks` once.
