# vim-simple Setup - Modern Plugin-based Configuration

This is the complete setup guide for a modern, plugin-based Bash development environment in Vim using vim-plug.

## Prerequisites
- macOS with Terminal
- Git installed
- No existing Vim configuration (or backup existing `~/.vim` and `~/.vimrc`)

## Installation Steps

### 1. Clone Repository

```bash
cd ~/code
git clone https://github.com/YOUR-USERNAME/vim-simple.git
```

### 2. Create Symlinks

```bash
ln -s ~/code/vim-simple/vimrc ~/.vimrc
ln -s ~/code/vim-simple/vim ~/.vim
```

### 3. Launch Vim

```bash
vim
```

**What happens on first launch:**
- vim-plug automatically downloads and installs itself
- All plugins automatically download and install
- This takes 30-60 seconds
- Vim will reload automatically when done

**Note:** Plugins are installed to `~/.vim-plugged` (outside the repo) to keep the repository clean for development.

**Done!** Your Vim is now configured.

## Features Enabled

### Plugin-based functionality

- **vim-plug**: Modern plugin manager with auto-installation
- **vim-sensible**: Sensible defaults
- **vim-commentary**: `gcc` to comment/uncomment lines
- **auto-pairs**: automatic pairing while working
- **vim-surround**: add surrounding pairs to existing text
- **vim-fugitive**: Git integration (`,gs`, `,gd`, `,gb`)
- **ALE**: Asynchronous syntax checking with bash and shellcheck
- **SnipMate**: Snippet engine with modern Bash snippets
- **AutoComplPop**: Auto-completion popup (appears after 3 characters)

### Custom Key Mappings

- `,N` - toggle line numbers
- `,l` - toggle invisible characters  
- `,.` - clear search highlighting
- `F2` - toggle paste mode

### Bash snippets with modern syntax:

- `bash<Tab>` - shebang: `#!/usr/bin/env bash`
- `#!<Tab>` - shebang (alternative trigger)
- `sbash<Tab>` - shebang with `set -euo pipefail`
- `if<Tab>` - if statement with `[[ ]]`
- `elif<Tab>` - elif statement with `[[ ]]`
- `for<Tab>` - for loop
- `while<Tab>` - while loop
- `case<Tab>` - case statement

### Automatic features:

- Syntax highlighting
- Auto-trim trailing whitespace on save
- 80-character line width with visual guide
- Automatic syntax checking on save
- Auto-completion popup after 3 characters

## Testing the Setup

```bash
vim /tmp/test.sh
```

**Test features:**
- Type 'if' and press Tab → snippet expansion
- Type 'echo' → auto-completion popup appears
- Press 'gcc' on a line → toggles comment
- Press ',gs' in a git repo → shows git status

## Plugin Management Commands

```vim
:PlugInstall    " Install plugins
:PlugUpdate     " Update all plugins
:PlugClean      " Remove unlisted plugins
:PlugStatus     " Check plugin status
```

## Snippet Configuration Details

### Why Custom Snippets?

The bundled vim-snippets plugin provides comprehensive snippets for many languages, but creates a conflict for bash scripting:

**The Problem:**
- vim-snippets includes both `sh.snippets` and `bash.snippets`
- The `bash.snippets` file contains `extends sh` which loads both files
- This creates duplicate "if", "for", "while" triggers
- SnipMate prompts you to choose between "bash" or "sh" versions every time
- We only write GNU bash scripts, never POSIX sh scripts

**The Solution:**
- Configure SnipMate to load ONLY from `~/.vim/after/snippets/` (vimrc:225)
- Completely ignore the bundled vim-snippets plugin directory
- Maintain our own `bash.snippets` with modern `[[ ]]` syntax

**The Tradeoff:**
- ✅ No more bash/sh prompts - snippets expand immediately
- ✅ All snippets use modern bash best practices (`[[ ]]`, not `[ ]`)
- ✅ Full control over snippet behavior
- ⚠️ Must manually add snippets from vim-snippets if needed

### Adding More Snippets

If you need additional snippets from vim-snippets:

1. View available snippets:
   ```bash
   cat ~/.vim-plugged/vim-snippets/snippets/bash.snippets
   cat ~/.vim-plugged/vim-snippets/snippets/sh.snippets
   ```

2. Copy desired snippets to your repo file:
   ```bash
   vim ~/code/vim-simple/vim/after/snippets/bash.snippets
   ```

3. Commit to your repo so Ansible deploys them

### Current Snippet Inventory

Located in `vim/after/snippets/bash.snippets`:
- Shebangs: `bash`, `#!`, `sbash`
- Control flow: `if`, `elif`, `for`, `while`, `case`
- All using modern `[[ ]]` conditionals

## References

- [vim-plug Documentation](https://github.com/junegunn/vim-plug)
- [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)