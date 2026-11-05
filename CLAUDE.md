# CLAUDE.md

This is a starter repo for students who may be new to programming. It is not a
project yet. The student decides what to build, and you build it with them.

## Before anything else

If `bin/doctor` hasn't passed this session, run it. If it fails, run
`bin/setup` and fix what you can. Some steps need the student, like logins.
For those, give them the exact command and tell them to type it with a `!`
in front (for example `! gh auth login`), so it runs in this session.

## Toolchain (do not deviate)

Tool versions are pinned in `mise.toml` and installed by mise. Never install
runtimes with brew, apt, nvm, pyenv, conda, or an official installer.

- **TypeScript / JavaScript → bun.** Use `bun init`, `bun add`, `bun run`,
  `bun test`, `bun x`. Never use npm, npx, yarn, pnpm, or node.
- **Python → uv.** Use `uv init`, `uv add`, `uv run`, `uvx`. Never use pip,
  `python -m venv`, poetry, or conda. Run scripts with `uv run`, not `python`.
- When the language doesn't matter, pick whichever the student already used.
  If they haven't used either, pick Python.
- Put each new project in its own top-level folder (`uv init analysis`,
  `mkdir dashboard && cd dashboard && bun init -y`). Don't put it at the repo
  root, which holds the setup files.

## TypeScript projects

- **Effect v4** is the standard library: `bun add effect` (the 4.x `latest`
  release). Use Effect for errors, async, services, and schemas
  (`effect/Schema`) instead of hand-rolled try/catch and validation. Effect
  v4 APIs differ from v3. When you're unsure, read the installed source in
  `node_modules/effect` instead of recalling v3 APIs from memory.
- Follow the `coding-standards` skill when writing TypeScript, and the
  `effect-service-design` skill when designing Effect services.
- Lint and format come from the repo root and cover every project. Run
  `bun run fix` (auto-fix lint, then format) and then `bun run check` (oxfmt
  plus type-aware oxlint with the vendored anti-slop rules in
  `tools/oxlint/anti-slop`). From a project folder, use
  `bun run --cwd .. fix`. Typecheck in the project with `bun x tsc --noEmit`. Fix findings properly. Don't disable
  rules, add `as` casts, or launder types through `unknown` to make them pass.
- Keep `strict` on in each project's `tsconfig.json` (`bun init` sets it).

## Show it working

Students learn by seeing results. When you build something, run it and show it:

- Scripts and analysis: run them and show the output. For charts, write an
  HTML or PNG file and open it (`open` on macOS, `explorer.exe` on WSL).
- Anything with a UI: start a dev server with live reload in the background
  and give the student the localhost URL. For bun, use `bun --hot`.
- Leave the student a single command that runs it again.

## Git

- Pre-commit hooks (`lefthook.yml`) scan for secrets (gitleaks) and
  lint/format Python (ruff) and TS/JS (oxfmt + oxlint). If a commit fails, fix the
  cause. Never use `--no-verify`.
- API keys and other secrets go in `.env`, which is gitignored. Never put
  them in code.
- `origin` may still point at the class template. Before the first push, run
  `bin/make-it-mine <name>` (once). It creates the student's own private
  GitHub repo and keeps the template as `upstream`.

## Talking to the student

Keep explanations short and plain. After each change, say what you did, how to
run it, and one thing worth understanding about it. Ask before big or
irreversible actions.
