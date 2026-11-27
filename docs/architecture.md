# Architecture

Clean architecture with three layers per feature, Bloc for state, and `get_it` + `injectable` for dependency injection.

## Layers

```
presentation  ──▶  domain  ◀──  data
(blocs, pages)    (entities,     (models, data sources,
                   repository     repository implementations)
                   interfaces,
                   use cases)
```

- **domain** is pure Dart. It defines entities, repository interfaces and use cases. It imports nothing from `data` or Flutter.
- **data** implements the repository interfaces. It talks to the API (`dio`) and local storage (`flutter_secure_storage`), parses JSON into models, and maps models to entities with `toEntity()`.
- **presentation** holds blocs/cubits, pages and widgets. Blocs call use cases (or repositories) and turn results into states.

Folder per feature:

```
lib/features/<feature>/
  data/
    datasources/
    models/
    repositories/
  domain/
    entities/
    repositories/
    usecases/
  presentation/
    bloc/
    pages/
    widgets/
```

Shared code lives in `lib/core/` (constants, DI, errors, shared models, utils).

## Request flow

1. Page dispatches an event to its bloc.
2. Bloc calls a use case.
3. Use case calls the repository interface.
4. Repository implementation calls the remote data source (`dio`), parses a model, maps it to an entity.
5. Repository returns `Either<Failure, Entity>` (`dartz`). Exceptions are caught here and turned into a `Failure`; they never reach the bloc.
6. Bloc folds the `Either` into a success or error state; the page rebuilds.

## Dependency injection

- `lib/core/di/injection.dart` exposes `getIt` and `configureDependencies()`, called in `runAppWithFlavor()`.
- Annotate classes with `@injectable`, `@lazySingleton`, or `@LazySingleton(as: SomeRepository)` to bind an implementation to its interface.
- Third-party objects (`Dio`, `FlutterSecureStorage`, `GeolocatorPlatform`) are provided in `lib/core/di/core_module.dart`.
- `injection.config.dart` is generated. Never edit it; run `dart run build_runner build -d`.

## Errors

- `lib/core/error/failure.dart` defines `Failure`. Add specific failures (network, server, cache, unauthorized) as subclasses when a feature needs to react differently to each.

## Flavors

| Flavor | Entry point | Android flavor | Backend |
| --- | --- | --- | --- |
| test | `lib/main_test.dart` (also `lib/main.dart`) | `dev` | test URL in `ApiConstants` |
| prod | `lib/main_prod.dart` | `prod` | prod URL in `ApiConstants` |

`FlavorConfig.set()` picks the base URLs at startup.

## Navigation

Named routes: add a constant to `RouteNames` and a case in `AppRouter.onGenerateRoute`.

## Code generation

`freezed`, `json_serializable` and `injectable_generator` all run through `build_runner`:

```bash
dart run build_runner build -d   # once
dart run build_runner watch -d   # while developing
```

Freezed 3+ classes must be declared `abstract class` or `sealed class`.
