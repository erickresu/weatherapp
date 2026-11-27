# Feature: Splash

Status: in progress
Created: 2026-11-18

## Goal

Show a loading screen while the app starts, then send the user to login or home.

## Screens

- `SplashScreen` (`lib/features/splash/pages/splash_screen.dart`): title and a progress indicator.

## API

None yet.

## Domain

- Entities: none yet.
- Use cases: check whether a saved token exists (to do).
- Repository interface: none yet.

## Notes

- Not the start route any more: the app opens on `RouteNames.weather` ([weather](weather.md)). Wire the splash back in when login exists.

## States

- Currently a static page with no bloc.

## Edge cases

- Token present but expired.

## Done when

- [ ] Navigates to `RouteNames.login` when there is no token
- [ ] Navigates to `RouteNames.home` when a valid token exists
- [ ] This note is updated with anything that changed while building
