# AI Starter

A blank repo set up for building with [Claude Code](https://claude.com/claude-code).
It installs the tools for you, so you don't have to. Build whatever you want: Python or TypeScript.

## Setup (once)

**Windows users:** install WSL first. Open PowerShell as administrator, run
`wsl --install`, and restart. Then open the **Ubuntu** app and do everything
below inside it. Don't use plain Windows.

```bash
git clone https://github.com/phall1/tamu-ai-bootstrap.git my-project
cd my-project
bin/setup
```

`bin/setup` installs everything and asks you to log in to GitHub and Claude.
It ends by running `bin/doctor`. Once that says **All good**, open a new
terminal window (so your shell picks up the tools) and run:

```bash
cd my-project
claude
```

Then type:

```
/start
```

Claude checks your setup and makes the repo your own on GitHub. Then it asks
what you want to build. You can also say it up front:
`/start a tool that summarizes news articles about a topic`.

## Something broke?

Run `bin/doctor`. Every ✗ line comes with the command that fixes it. You can
also just tell Claude "bin/doctor is failing, fix it."

## What's in here

| File | What it does |
| --- | --- |
| `mise.toml` | Pins the tools: bun, Python, uv, gh, and the linters |
| `package.json`, `oxlint.config.ts` | TypeScript lint/format for every project in the repo: oxlint, oxfmt, and the [anti-slop](https://github.com/dmmulroy/anti-slop) rules (in `tools/oxlint/`) |
| `bin/setup` | Installs everything (safe to re-run) |
| `bin/doctor` | Checks everything is installed and logged in |
| `lefthook.yml` | Pre-commit checks: blocks secrets, formats Python and TS |
| `CLAUDE.md` | Tells Claude how to work in this repo |
| `.claude/` | The `/start` command, allowed commands, and skills (TypeScript coding standards, Effect service design, anti-slop updates) |

Python projects use **uv** and **ruff**. TypeScript projects use **bun**,
**[Effect v4](https://effect.website)**, **oxlint**, and **oxfmt**. Claude
knows all of this already, so just describe what you want.

## Getting template updates

`/start` renames the class template remote to `upstream`. To pull in
later changes to the template:

```bash
git pull upstream main
```
