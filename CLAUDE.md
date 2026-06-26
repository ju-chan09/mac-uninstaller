# mac-uninstall

macOS app cleaner for the terminal — like AppCleaner, but in your shell.

## File structure

```
uninstall              — the entire program (single Python 3 script, executable)
mac_uninstall.py       — thin importlib wrapper; entry point for pip/pipx installs
pyproject.toml         — pip packaging (name: mac-uninstall, command: uninstall)
Formula/mac-uninstall.rb — Homebrew formula with pinned resource hashes
install.sh             — legacy: copies script to /usr/local/bin/uninstall
LICENSE                — MIT
README.md
```

## Deployment

**During development** — copy directly to PATH:
```
cp uninstall ~/.local/bin/uninstall
```

**Homebrew (from source)**:
```
brew install --build-from-source Formula/mac-uninstall.rb
```

**pipx**:
```
pipx install -e .
```

## Versioning

`__version__` lives at the top of `uninstall`. When bumping:
1. Update `__version__` in `uninstall`
2. Update `version` in `pyproject.toml`
3. Update resource URLs + SHA256 hashes in `Formula/mac-uninstall.rb`
   (use `brew fetch --build-from-source Formula/mac-uninstall.rb` to verify)
4. Tag the release: `git tag v1.x.x && git push --tags`

## Key design decisions

- **Single file** — all logic lives in `uninstall`; `mac_uninstall.py` is a shim.
- **No Finder/System Events automation** — eliminates Automation permission prompts. Quit uses SIGTERM → SIGKILL directly.
- **Admin prompt fires once** — trash/delete batches all retryable paths into a single `osascript do shell script` call.
- **Container paths need FDA, not admin** — `~/Library/Containers/`, `~/Library/Group Containers/`, `~/Library/Daemon Containers/` are protected by Full Disk Access. Admin retry is skipped for these; a hint is shown instead.
- **Apple built-in apps hidden** — apps with `com.apple.*` bundle IDs are filtered from the browser in normal mode (visible in `-p` preview mode).
- **Browser shows 15 apps** — capped at 15 visible rows regardless of terminal height.
- **Protected bundles skip shutil** — `.app` bundles outside `~` return failure immediately in the first pass, falling through to the admin `mv` batch.

## Code layout

| Section | What it covers |
|---|---|
| `scan()` | Finds all leftover files across ~/Library, /Library, /private/var/db, etc. |
| `render_table()` | Displays items with category, path, and size |
| `move_to_trash()` | Direct `shutil.move` to ~/.Trash; protected bundles fail to admin retry |
| `_trash_admin_batch()` | Batched `mv` via one admin osascript call |
| `delete_permanent()` | Direct `shutil.rmtree`; protected bundles fail to admin retry |
| `_osascript_rm_batch()` | Batched `rm -rf` via one admin osascript call |
| `do_trash()` / `do_delete()` | Two-pass flow; splits container failures out for FDA hint |
| `_show_fda_hint()` | Shown for container failures instead of admin retry prompt |
| `get_running_pids()` | Detects running processes via `pgrep` only (no System Events) |
| `quit_app()` | SIGTERM → wait → SIGKILL; no AppleScript |
| `_is_apple_app()` | Reads Info.plist via plistlib; filters built-in Apple apps |
| `browser()` | Full-terminal app picker, 15 rows, filters Apple apps in normal mode |
| `action_menu()` | Arrow-key menu: Homebrew / Trash / Delete / Cancel |
| `run()` | Main flow: scan → table → action → execute |
