# Base stack for the template

Date: 2026-11-18
Status: accepted

## Context

This repo is a starting point for new Flutter apps. Every project built from it inherits its stack, so the choices need to be stable, well known, and easy for both people and AI agents to follow.

## Decision

- State management: `flutter_bloc` 9 + `equatable`.
- Dependency injection: `get_it` 9 + `injectable` 3 (generated registration).
- Networking: `dio` 5 with `pretty_dio_logger`.
- Models: `freezed` 3/4 + `json_serializable`.
- Errors: repositories return `Either<Failure, T>` from `dartz`.
- Navigation: named routes with `onGenerateRoute`.
- Toolchain: Dart `^3.13.0`, Android Gradle 9.3.1 / AGP 9.1.0 / Kotlin 2.4.0 / Java 17, iOS 15.0 minimum.

## Alternatives considered

- Riverpod 3: popular for new projects, but Bloc is already in place and well understood.
- `go_router`: better for deep links, auth redirects and bottom navigation. Not needed until an app requires those.

## Consequences

- `dartz` is no longer maintained. It works today; replace it with `fpdart` or a small sealed `Result` type when convenient.
- If an app needs deep links or nested navigation, switch to `go_router` and record that in a new decision.
