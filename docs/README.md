# Project docs

This folder is the project's notes. It is plain Markdown, so it works three ways:

- **Obsidian:** open this `docs/` folder as a vault (*Open folder as vault*).
- **Claude Code / other AI agents:** `CLAUDE.md` tells the agent to read these notes before building and to update them after.
- **GitHub / any editor:** links are standard relative Markdown links, so they render everywhere.

## Notes

- [Architecture](architecture.md): layers, data flow, DI, error handling, flavors, code generation.
- [Decisions](decisions/): why the project does things the way it does. One file per decision.
- [Features](features/): one spec per feature: goal, screens, API, states, edge cases.

## Templates

New notes start from [templates/](templates/). In Obsidian, run *Templates: Insert template* (the vault is already configured to use that folder).

- [Feature spec](templates/feature.md)
- [Decision record](templates/decision.md)

## How to keep it useful

- Write the feature spec **before** asking an agent to build the feature. A short spec beats a long prompt.
- When a choice surprises someone ("why do we use X?"), write a decision record.
- Keep notes short. Delete notes that are no longer true; git keeps the history.
- Do not put secrets, API keys or customer data here. This folder is committed.
