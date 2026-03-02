# Migrating to chezmoi

This guide outlines the steps to migrate an existing flat dotfiles repository to **chezmoi**, a modern, robust, and secure dotfiles manager.

## Why chezmoi?

Unlike traditional symlink managers (like GNU Stow or custom bash scripts), chezmoi operates differently:

1. **No Symlinks (By Default):** It securely copies files into your home directory, avoiding issues with broken links or applications that refuse to follow symlinks.
2. **Git-Friendly Naming:** Hidden files like `.zshrc` are stored in the git repository as `dot_zshrc`. This prevents your dotfiles repo from looking empty or confusing on GitHub.
3. **Templates & Secrets:** It natively supports templating (e.g., applying different configs for macOS vs. Linux) and integrates with password managers (1Password, Bitwarden) to keep secrets out of your public repo.
4. **Idempotent:** You can run `chezmoi apply` 100 times safely. It only makes changes if the source state differs from the target state.

---

## Migration Steps

These steps assume you have an existing flat dotfiles structure (like the one previously in `~/repos/my_github/dotfiles`) currently copied or symlinked into your `$HOME` directory.

### Step 1: Install chezmoi

Install chezmoi using Homebrew (or your preferred package manager):

```bash
brew install chezmoi
```

### Step 2: Initialize a New State

Initialize a fresh, blank chezmoi state. This creates a new, hidden git repository in `~/.local/share/chezmoi`. This folder will become your new single source of truth.

```bash
chezmoi init
```

### Step 3: Add Your Existing Dotfiles

Tell chezmoi to take over management of your existing files in your home directory. `chezmoi add` copies the target file into its source directory (`~/.local/share/chezmoi`) and renames it according to its internal convention.

Add your core top-level files:

```bash
chezmoi add ~/.zshrc ~/.zprofile ~/.gitconfig ~/.gitignore ~/.editorconfig ~/.curlrc ~/.nanorc ~/.ripgreprc
```

Add your configuration directories. chezmoi is smart enough to handle nested folders recursively:

```bash
chezmoi add ~/.config/starship.toml
chezmoi add ~/.config/bat/config
chezmoi add ~/.config/brew/Brewfile
chezmoi add ~/.config/git
chezmoi add ~/.config/mise
chezmoi add ~/.config/serie
chezmoi add ~/.zshrc.d
```

### Step 4: Link to Your Git Repository

Now that chezmoi is tracking your files locally, you need to connect its hidden repository to your remote (e.g., GitHub) so you can push your changes.

Open a shell inside the chezmoi source directory:

```bash
chezmoi cd
```

Initialize the git repository (if not already done by `chezmoi init`), add your remote, and push the new structure.

> **Warning:** The following commands assume you are overwriting an existing flat repository. If you want to keep the old history, consider creating a new remote repository (e.g., `dotfiles-chezmoi`).

```bash
# Ensure you are on the main branch
git branch -M main

# Add your GitHub repo as the remote origin
git remote add origin git@github.com:my_github/dotfiles.git

# Stage all the new "dot_" files and directories
git add .

# Commit the migration
git commit -m "chore: migrate to chezmoi"

# Force push to overwrite the old flat structure with the new chezmoi structure
git push -u origin main --force

# Exit the chezmoi directory
exit
```

### Step 5: Clean Up

Since `~/.local/share/chezmoi` is now your active git repository managing your dotfiles, you can safely delete your old cloned folder to avoid confusion.

```bash
rm -rf ~/repos/my_github/dotfiles
```

---

## Daily Workflow with chezmoi

Once migrated, your daily interaction with dotfiles changes slightly:

*   **To edit a tracked file:** Do not edit the file in `~/.zshrc` directly if you want the changes saved. Instead, use:
    ```bash
    chezmoi edit ~/.zshrc
    ```
    This opens the file in your `$EDITOR`, edits the underlying source in `~/.local/share/chezmoi`, and applies the changes instantly when you save and close.

*   **To pull changes from another machine:**
    ```bash
    chezmoi update
    ```
    This pulls the latest commits from your remote repository and applies them.

*   **To see what would change before applying:**
    ```bash
    chezmoi diff
    ```

*   **To add a completely new file to your dotfiles:**
    ```bash
    chezmoi add ~/.config/new_app/config.json
    ```

*   **To manage the git repository directly:**
    ```bash
    chezmoi cd
    git status
    git commit -a -m "Update some configs"
    git push
    exit
    ```