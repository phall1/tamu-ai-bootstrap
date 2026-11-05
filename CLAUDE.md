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
  `bun test`, `bunx`. Never use npm, npx, yarn, pnpm, or node.
- **Python → uv.** Use `uv init`, `uv add`, `uv run`, `uvx`. Never use pip,
  `python -m venv`, poetry, or conda. Run scripts with `uv run`, not `python`.
- When the language doesn't matter, pick whichever the student already used.
  If they haven't used either, pick Python.
- Put each new project in its own top-level folder (`uv init analysis`,
  `mkdir dashboard && cd dashboard && bun init -y`). Don't put it at the repo
  root, which holds the setup files.

## Show it working

Students learn by seeing results. When you build something, run it and show it:

- Scripts and analysis: run them and show the output. For charts, write an
  HTML or PNG file and open it (`open` on macOS, `explorer.exe` on WSL).
- Anything with a UI: start a dev server with live reload in the background
  and give the student the localhost URL. For bun, use `bun --hot`.
- Leave the student a single command that runs it again.

## Git

- Pre-commit hooks (`lefthook.yml`) scan for secrets (gitleaks) and
  lint/format Python (ruff) and TS/JS (biome). If a commit fails, fix the
  cause. Never use `--no-verify`.
- API keys and other secrets go in `.env`, which is gitignored. Never put
  them in code.
- `origin` may still point at the class template. Before the first push, make
  the student their own repo: `git remote rename origin upstream && gh repo create <name> --private --source . --remote origin --push`.

## Talking to the student

Keep explanations short and plain. After each change, say what you did, how to
run it, and one thing worth understanding about it. Ask before big or
irreversible actions.
