# Drag and Drop from Terminal (macOS) - Setup Guide

Enables dragging files from the terminal into any macOS app using the `drag` command.

## Prerequisites

- macOS with Command Line Tools installed (`xcode-select --install`)
- [yazi](https://github.com/sxyazi/yazi) file manager (optional, for keybinding integration)

## Step 1: Clone and compile

```bash
git clone https://github.com/Wevah/dragterm.git
cd dragterm
clang -fobjc-arc -o drag dragterm/DTDraggingSourceView.m dragterm/main.m -framework Cocoa
```

## Step 2: Install the binary

```bash
mkdir -p ~/bin
mv drag ~/bin/
```

## Step 3: Add ~/bin to PATH

Add this line to your `~/.zshrc`:

```bash
export PATH="$HOME/bin:$PATH"
```

Then reload:

```bash
source ~/.zshrc
```

## Step 4: Verify

```bash
drag ~/path/to/any-file
```

A file icon should appear under your cursor. Drag it into any app. Press `Escape` or `q` to cancel.

## Step 5: Cleanup

```bash
rm -rf ~/dragterm
```

## Step 6: Yazi integration (optional)

Create `~/.config/yazi/keymap.toml` (or add to existing):

```toml
[[mgr.prepend_keymap]]
on = "<C-g>"
run = "shell --confirm -- /full/path/to/bin/drag %s"
desc = "Drag and drop selected file(s)"
```

**Important:** Use the full absolute path to `drag` (e.g., `/Users/yourname/bin/drag`) since yazi's shell may not have `~/bin` in PATH.

Restart yazi, then press `Ctrl+G` on a selected file to drag it.
