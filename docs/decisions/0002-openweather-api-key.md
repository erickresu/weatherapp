# OpenWeather API key via --dart-define-from-file

Date: 2026-11-27
Status: accepted

## Context

The weather feature calls OpenWeather directly from the app, and every request needs an API key. `CLAUDE.md` says keys must not live in the app source, and there is no backend yet to hold the key.

## Decision

- The key is read at compile time with `String.fromEnvironment('OPENWEATHER_API_KEY')` in `ApiConstants`.
- Developers put it in `env/dev.json` (gitignored) and run with `--dart-define-from-file=env/dev.json`. `env/example.json` is committed as the template.
- If the key is missing, the data source throws `MissingApiKeyException` and the user sees a clear error instead of a 401.

## Alternatives considered

- Hardcode the key in an `AppConfig` class: simplest, but the key goes into git history.
- Backend proxy that adds the key server-side: the only way to keep the key fully private, but needs a server we do not have yet.

## Consequences

- The key stays out of git, but it is still compiled into the app and can be extracted from a built APK/IPA. Acceptable for a free-tier OpenWeather key; not for a paid or shared one.
- Every `flutter run`, `flutter build` and IDE launch config must pass `--dart-define-from-file`.
- Revisit when a backend exists: move OpenWeather calls behind it and drop the key from the app.
