---
description: Check setup, make this your own repo, and start building
---

Take the student from a fresh clone to building something. In order:

1. **Check setup.** Run `bin/doctor`. If it fails, run `bin/setup` and fix
   what's left. When a step needs the student (a login, say), give them the
   exact command with a `!` in front and wait. Repeat until `bin/doctor` passes.
2. **Make it theirs.** If `bin/make-it-mine --check` fails, ask what they want
   to build (unless they already said: $ARGUMENTS). Suggest a short repo name
   based on it, confirm the name, then run `bin/make-it-mine <name>`.
3. **Build.** Follow CLAUDE.md: pick Python (uv) or TypeScript (bun), create
   the project in its own folder, get a first version running, and show it.
