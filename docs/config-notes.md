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

### 4. Disable Conflicting Bundled Snippets

```bash
cd ~/.vim-plugged/vim-snippets/snippets/
mv bash.snippets bash.snippets.disabled
mv sh.snippets sh.snippets.disabled
mv zsh.snippets zsh.snippets.disabled
```

**Note:** Plugins are installed to `~/.vim-plugged` (outside the repo) to keep the repository clean for development.

**Done!** Your Vim is now configured.

## Features Enabled

### Plugin-based functionality

- **vim-plug**: Modern plugin manager with auto-installation
- **vim-sensible**: Sensible defaults
- **vim-commentary**: `gcc` to comment/uncomment lines
- **vim-surround**: Surround text with quotes, brackets, etc.
- **vim-fugitive**: Git integration (`,gs`, `,gd`, `,gb`)
- **ALE**: Asynchronous syntax checking with bash and shellcheck
- **SnipMate**: Snippet engine with modern Bash snippets
- **AutoComplPop**: Auto-completion popup (appears after 3 characters)

### Custom key mappings:

- `,N` - toggle line numbers
- `,l` - toggle invisible characters  
- `,.` - clear search highlighting
- `F2` - toggle paste mode

### Bash snippets with modern syntax:

- `if<Tab>` - if statement with `[[ ]]`
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

## References

- [vim-plug Documentation](https://github.com/junegunn/vim-plug)
- [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)