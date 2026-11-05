---
description: Check setup, make this your own repo, and start building
---

Get this student from a fresh clone to building something. Go in order:

1. **Doctor.** Run `bin/doctor`. If anything fails, run `bin/setup`, then fix
   what remains. For steps that need the student (logins, git name/email),
   give them the exact command with a `!` in front and wait for them to run it.
   Re-run `bin/doctor` until it passes.
2. **Their own repo.** If `bin/make-it-mine --check` fails, suggest a short
   repo name based on what they want to build, confirm it with them, then run
   `bin/make-it-mine <name>`. It creates a private repo on their GitHub
   account and keeps the class template as `upstream`.
3. **Build.** Ask what they want to make, in one sentence. If they already
   said ($ARGUMENTS), skip the question. Then follow CLAUDE.md: choose bun or
   uv, scaffold the project in its own folder, get a first version running,
   and show it to them.
