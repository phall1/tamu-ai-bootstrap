# AI Starter

A blank starting point for building anything with [Claude Code](https://claude.com/claude-code).
You say what you want and Claude builds it. Everything is already set up.

## Start

**On Windows?** Install WSL first. Open PowerShell as administrator, run
`wsl --install`, and restart. Then open the **Ubuntu** app and run the
commands below in it.

```bash
git clone https://github.com/phall1/tamu-ai-bootstrap.git my-project
cd my-project
bin/setup
```

That's it. Setup installs the tools, has you log in to GitHub and Claude, and
opens Claude. If Claude asks whether you trust the folder, choose **Yes**.
Claude then makes this your own GitHub repo and asks what you want to build.

To come back later:

```bash
cd my-project
claude
```

**Something broken?** Run `bin/doctor`. It prints the fix for each problem.
You can also just tell Claude what went wrong.

## What's set up

- **Python:** [uv](https://docs.astral.sh/uv/) for packages and running code,
  plus [ruff](https://docs.astral.sh/ruff/) for linting and formatting.
- **TypeScript:** [bun](https://bun.sh) for running code, packages, and tests.
  [Effect v4](https://effect.website) is the standard library. Lint and format
  come from [oxlint](https://oxc.rs) with the
  [anti-slop](https://github.com/dmmulroy/anti-slop) rules, plus oxfmt.
- **Every commit** is auto-formatted and checked for leaked passwords and keys.

| File | Purpose |
| --- | --- |
| `bin/setup` | Installs and logs in to everything, then starts Claude |
| `bin/doctor` | Checks everything and prints the fix for each problem |
| `bin/make-it-mine` | Creates your own GitHub repo for this folder (Claude runs it for you) |
| `mise.toml` | Tool versions, installed by [mise](https://mise.jdx.dev) |
| `CLAUDE.md`, `.claude/` | How Claude works here: the rules, `/start`, and skills |
| `lefthook.yml` | What runs on each commit |
| `package.json`, `oxlint.config.ts`, `tools/oxlint/` | TypeScript lint and format settings |
