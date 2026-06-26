# mac-uninstall

A terminal app cleaner for macOS. Scans an app and everything it left behind — caches, preferences, containers, launch agents, and more — then lets you move it all to Trash, delete it permanently, or uninstall through Homebrew.

## Install

### Homebrew (recommended)

```sh
brew tap ju-chan09/mac-uninstall
brew install mac-uninstall
```

### pipx

```sh
pipx install git+https://github.com/ju-chan09/mac-uninstall.git
```

### Manual

```sh
curl -o ~/.local/bin/uninstall \
  https://raw.githubusercontent.com/ju-chan09/mac-uninstall/main/uninstall
chmod +x ~/.local/bin/uninstall
```

Make sure `~/.local/bin` is in your `$PATH`. `rich` is installed automatically on first run.

## Usage

```
uninstall                  open the interactive app browser
uninstall <AppName>        scan a specific app
uninstall -p               preview mode — shows what would be removed, changes nothing
uninstall -p <AppName>
uninstall --version
uninstall --help
```

## What it removes

| Category | Location |
|---|---|
| App bundle | `/Applications/` |
| App Support | `~/Library/Application Support/` |
| Caches | `~/Library/Caches/` |
| Preferences | `~/Library/Preferences/` |
| Containers | `~/Library/Containers/` |
| Group Containers | `~/Library/Group Containers/` |
| Launch Agents | `~/Library/LaunchAgents/`, `/Library/LaunchAgents/` |
| Launch Daemons | `/Library/LaunchDaemons/` |
| Logs | `~/Library/Logs/` |
| Crash Reports | `~/Library/Logs/DiagnosticReports/` |
| Homebrew Caskroom | `/opt/homebrew/Caskroom/` |
| + more | Saved State, WebKit, Cookies, Helper Tools, Kernel Extensions, … |

## Keys

| Key | Action |
|---|---|
| `↑` `↓` | Navigate |
| `↵` | Select / confirm |
| Type | Filter app list |
| `B` | Uninstall via Homebrew *(if cask detected)* |
| `T` | Move to Trash |
| `D` | Delete permanently |
| `N` / `Esc` | Cancel |

## App Store apps

App Store apps store data in `~/Library/Containers/`, which macOS protects with **Full Disk Access** — admin alone won't work. If container deletion fails, grant your terminal Full Disk Access:

**System Settings → Privacy & Security → Full Disk Access → add your terminal**

## Notes

- Built-in Apple apps (Safari, Messages, FaceTime, etc.) are hidden from the browser. Use `-p <AppName>` to preview them.
- If any files need elevated permissions, you'll be prompted for your password once for all of them.
- No Finder or System Events automation permissions are needed.

## Requirements

- macOS 12 Monterey or later
- Python 3.9+
- [`rich`](https://github.com/Textualize/rich) — installed automatically, or bundled when installed via Homebrew

## License

MIT — see [LICENSE](LICENSE).
