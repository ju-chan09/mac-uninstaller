# mac-uninstall

<<<<<<< HEAD
A simple terminal utility for removing macOS apps along with the files they leave behind. It scans for app data such as caches, preferences, containers, launch agents, and more, then lets you move everything to the Trash, delete it permanently, or uninstall through Homebrew.
||||||| parent of be656c7 (Fixing docs)
Like AppCleaner, but in your terminal. Finds an app and all its leftover files — caches, preferences, containers, launch agents, and more — then lets you move them to Trash, delete permanently, or uninstall via Homebrew.
=======
A terminal app cleaner for macOS. Scans an app and everything it left behind — caches, preferences, containers, launch agents, and more — then lets you move it all to Trash, delete it permanently, or uninstall through Homebrew.
>>>>>>> be656c7 (Fixing docs)

## Install

### Homebrew (recommended)

<<<<<<< HEAD
After creating a release and updating the formula SHA, run:

||||||| parent of be656c7 (Fixing docs)
First, tag a release and update the formula SHA, then:

=======
>>>>>>> be656c7 (Fixing docs)
```sh
brew tap ju-chan09/mac-uninstall
brew install mac-uninstall
```

<<<<<<< HEAD
To install directly from this repository during development:

```sh
brew install --build-from-source Formula/mac-uninstall.rb
```

||||||| parent of be656c7 (Fixing docs)
Or install directly from this repo while in development:

```sh
brew install --build-from-source Formula/mac-uninstall.rb
```

=======
>>>>>>> be656c7 (Fixing docs)
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

<<<<<<< HEAD
Make sure `~/.local/bin` is included in your `$PATH`. If `rich` isn't already installed, it will be installed automatically the first time you run the tool.
||||||| parent of be656c7 (Fixing docs)
Make sure `~/.local/bin` is in your `$PATH`. `rich` is auto-installed on first run.
=======
Make sure `~/.local/bin` is in your `$PATH`. `rich` is installed automatically on first run.
>>>>>>> be656c7 (Fixing docs)

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

<<<<<<< HEAD
## App Store apps and sandbox containers

Apps installed through the App Store keep their data in `~/Library/Containers/`, which is protected by macOS **Full Disk Access**. Administrator privileges alone won't allow those files to be removed. If container cleanup fails, give your terminal Full Disk Access:

> **System Settings → Privacy & Security → Full Disk Access → add your terminal**

## Action menu
||||||| parent of be656c7 (Fixing docs)
## App Store apps and sandbox containers

App Store apps store data in `~/Library/Containers/` which is protected by macOS's **Full Disk Access** permission — admin privileges alone are not enough. If container deletion fails, grant Full Disk Access to your terminal:

> **System Settings → Privacy & Security → Full Disk Access → add your terminal**

## Action menu
=======
## Keys
>>>>>>> be656c7 (Fixing docs)

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

<<<<<<< HEAD
- **Apple built-in apps** (Safari, Messages, FaceTime, etc.) don't appear in the app browser. Use `-p` if you only want to preview their files.
- **System apps** located in `/System/` cannot be selected.
- If elevated permissions are needed, you'll only be prompted for your administrator password once.
- Finder automation and System Events permissions are not required.
||||||| parent of be656c7 (Fixing docs)
- **Apple built-in apps** (Safari, Messages, FaceTime, etc.) are excluded from the browser. Use `-p` to preview them.
- **System apps** in `/System/` cannot be selected at all.
- The admin password prompt (for protected files) appears once for all items together.
- No Finder automation or System Events permission is required.
=======
- Built-in Apple apps (Safari, Messages, FaceTime, etc.) are hidden from the browser. Use `-p <AppName>` to preview them.
- If any files need elevated permissions, you'll be prompted for your password once for all of them.
- No Finder or System Events automation permissions are needed.
>>>>>>> be656c7 (Fixing docs)

## Requirements

- macOS 12 Monterey or later
- Python 3.9+
<<<<<<< HEAD
- [`rich`](https://github.com/Textualize/rich) (installed automatically if needed, or bundled when installed through Homebrew)

## Contributing

1. Fork and clone the repository.
2. Make your changes in `uninstall` (the single-file script).
3. Test with `./uninstall -p <AppName>`.
4. Open a pull request.

When releasing a new version, update `__version__` in `uninstall`, the `version` field in `pyproject.toml`, and the resource URLs and SHA hashes in `Formula/mac-uninstall.rb`.

## Setting up the Homebrew tap

Create a separate public repository named `homebrew-mac-uninstall` (the `homebrew-` prefix is required by Homebrew). Copy `Formula/mac-uninstall.rb` into the repository's `Formula/` directory. Users can then install it with:

```sh
brew tap ju-chan09/mac-uninstall
brew install mac-uninstall
```
||||||| parent of be656c7 (Fixing docs)
- [`rich`](https://github.com/Textualize/rich) (auto-installed if missing, or bundled when installed via Homebrew)

## Contributing

1. Fork and clone the repo
2. Make changes to `uninstall` (the single-file script)
3. Test: `./uninstall -p <AppName>`
4. Open a PR

When bumping the version, update `__version__` in `uninstall`, `version` in `pyproject.toml`, and the resource URLs/hashes in `Formula/mac-uninstall.rb`.

## Setting up the Homebrew tap

Create a separate public repo named `homebrew-mac-uninstall` (the `homebrew-` prefix is required by Homebrew). Copy `Formula/mac-uninstall.rb` into its `Formula/` directory. Users can then install with:

```sh
brew tap ju-chan09/mac-uninstall
brew install mac-uninstall
```
=======
- [`rich`](https://github.com/Textualize/rich) — installed automatically, or bundled when installed via Homebrew
>>>>>>> be656c7 (Fixing docs)

## License

MIT — see [LICENSE](LICENSE).
