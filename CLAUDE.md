# CLAUDE.md

This is a starter repo for students, many of them new to programming. There's
no project yet. The student says what they want, and you build it with them.

## First

If `bin/doctor` hasn't passed this session, run it. If it fails, run
`bin/setup` and fix what you can. When a step needs the student (logins, for
example), give them the exact command with a `!` in front, such as
`! gh auth login`, so it runs in this session.

## Remote workspace

When `TAMU_WORKSPACE=1` (`bin/doctor` then shows "TAMU workspace"), you're on
a remote computer the student reaches through a browser. Setup and Claude
access are already done, so don't mention them.

- On the first turn, greet the student by name, say in a sentence or two
  that this is their own computer for building things with Claude, and ask
  what they want to build.
- Never run `open` or `explorer.exe`, and never give out a `localhost` URL.
- Start dev servers on `0.0.0.0` (`Bun.serve({ hostname: "0.0.0.0" })`,
  `bun x vite --host 0.0.0.0`, `uv run python -m http.server 8000 --bind
  0.0.0.0`). Give the student the preview link: `WORKSPACE_PREVIEW_URL`
  (`bin/doctor` prints it) with the port in `{port}`. To show an HTML or PNG
  file, serve its folder the same way.
- GitHub is optional here. Offer `! gh auth login --web --git-protocol https`
  only when the student wants to save their work on GitHub.

## Claude access

Claude Code here runs on either a TAMU AI Chat API key or the student's own
Claude subscription (in a remote workspace, always TAMU AI, with nothing to
switch). `bin/use` shows which one is active. To switch, the
student exits Claude and runs `bin/use tamu` or `bin/use claude` in a
terminal, then starts `claude` again. Never ask for an API key in chat.
`bin/use tamu` reads it privately and saves it outside the repo.

## Tools (don't deviate)

mise installs every tool (`mise.toml`). Never install runtimes with brew, apt,
nvm, pyenv, conda, or an installer script.

- **Python → uv.** Use `uv init`, `uv add`, `uv run`, `uvx`. Never use pip,
  venv, poetry, conda, or bare `python`.
- **TypeScript → bun.** Use `bun init`, `bun add`, `bun run`, `bun test`,
  `bun x`. Never use npm, npx, yarn, pnpm, or node.
- If the student has no preference, use what they used last, or Python.
- Give each project its own top-level folder (`uv init analysis`, or
  `mkdir dashboard && cd dashboard && bun init -y`). The repo root holds the
  setup files.

## TypeScript

- Use **Effect v4** (`bun add effect`) for errors, async, services, and
  `Schema` parsing, instead of try/catch or hand-written validation. v4 APIs
  differ from v3. When unsure, read `node_modules/effect/src` rather than
  relying on memory.
- Follow the `coding-standards` skill. For Effect services, use
  `effect-service-design`.
- From the repo root, run `bun run fix` (lint autofix + format), then
  `bun run check`. From a project folder, run `bun run --cwd .. fix`.
  Typecheck in the project with `bun x tsc --noEmit`.
- Fix lint findings for real. Don't disable rules, add `as` casts, or launder
  types through `unknown`.

## Show it working

Students learn by seeing results (in a remote workspace, show them with
preview links as above):

- Run scripts and show the output. For charts, write an HTML or PNG file and
  open it (`open` on macOS, `explorer.exe` on WSL).
- For anything with a UI, start a dev server with live reload (`bun --hot`)
  and give the student the localhost URL.
- Always finish with the one command that runs it again.

## Git

- Pre-commit hooks block secrets and format code. If a commit fails, fix the
  cause. Never use `--no-verify`.
- API keys go in `.env`, which is gitignored. Never put them in code.
- Before the first push, run `bin/make-it-mine --check`. If it fails, run
  `bin/make-it-mine <name>` to create the student's own private GitHub repo.

## Talking to the student

Be brief and plain. After each change, say what you did, how to run it, and
one thing worth understanding. Ask before anything big or irreversible.
