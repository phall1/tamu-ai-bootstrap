# AI Starter

A blank starting point for building anything with [Claude Code](https://claude.com/claude-code).
You say what you want and Claude builds it. Everything is already set up.

## Start

One line in a terminal (on Windows, first run `wsl --install` in PowerShell as
administrator, restart, and use the **Ubuntu** app):

```bash
curl -fsSL https://raw.githubusercontent.com/phall1/tamu-ai-bootstrap/main/install.sh | bash
```

That's it. Setup installs the tools, has you log in to GitHub, and asks how
you'll use Claude:

1. **TAMU AI Chat API key:** no subscription needed. Make a key at
   [chat.tamu.ai](https://chat.tamu.ai) ("Create and Test API Key" in the
   docs) and paste it when setup asks.
2. **Your own Claude subscription (Pro or Max):** log in in the browser.

Then it opens Claude. If Claude asks whether you trust the folder, choose **Yes**.
Claude then makes this your own GitHub repo and asks what you want to build.

To come back later:

```bash
cd ~/ai-project
claude
```

**Want a computer in the cloud too?** If your class has
[TAMU AI Workspaces](https://github.com/phall1/tamu-ai-workspaces), open your
link and press **Connect** on T3 Code. The workspace shows up as another
machine next to this laptop, with this same starter already set up.

**Switching between TAMU and your own subscription:** exit Claude, run
`bin/use tamu` or `bin/use claude`, and start `claude` again. Run `bin/use` on
its own to see which one is active. For a different TAMU model, run
`bin/use tamu --model "<name>"`. If you give it a name that doesn't exist, it
lists the ones you can use.

**In a TAMU workspace** (a remote computer in your browser), all of this is
already done. Just tell Claude what you want to build. It gives you a link to
see what it makes.

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
| `bin/use` | Switches Claude between TAMU AI Chat and your own subscription |
| `bin/make-it-mine` | Creates your own GitHub repo for this folder (Claude runs it for you) |
| `mise.toml` | Tool versions, installed by [mise](https://mise.jdx.dev) |
| `CLAUDE.md`, `.claude/` | How Claude works here: the rules, `/start`, and skills |
| `lefthook.yml` | What runs on each commit |
| `package.json`, `oxlint.config.ts`, `tools/oxlint/` | TypeScript lint and format settings |
