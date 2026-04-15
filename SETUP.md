# Homebrew Tap Setup

Step-by-step guide to publish and maintain the DropShot Homebrew cask.

## First-time setup

### 1. Create the tap repo on GitHub

Create `github.com/scfi-exe/homebrew-tap` as a **public** repo. Homebrew requires
the `homebrew-<name>` naming convention for taps — the `homebrew-` prefix is
what makes `brew tap scfi-exe/tap` resolve correctly.

```bash
gh repo create scfi-exe/homebrew-tap --public \
    --description "Homebrew tap for DropShot"
```

### 2. Push this directory to that repo

From the MacShot project root:

```bash
cd homebrew-tap
git init
git add .
git commit -m "Initial cask: DropShot 1.0"
git remote add origin https://github.com/scfi-exe/homebrew-tap.git
git push -u origin main
```

### 3. Test the install

```bash
brew tap scfi-exe/tap && brew install --cask dropshot
```

### 4. Verify

```bash
open /Applications/DropShot.app
```

---

## Future Releases

For each new version, the workflow is:

1. **Build the `.dmg` in MacShot:**
   ```bash
   ./scripts/build-dmg.sh
   ```

2. **Upload the `.dmg` to the public repo:**
   ```bash
   gh release create v1.1 build/DropShot-1.1.dmg --repo scfi-exe/DropShot
   ```
   The `--repo` flag is important — it targets the public `DropShot` repo, not
   the private `MacShot` dev repo.

3. **Update the cask formula:**
   ```bash
   cd homebrew-tap
   ./scripts/update-cask.sh 1.1 ../build/DropShot-1.1.dmg
   ```
   This computes the SHA256, rewrites `Casks/dropshot.rb`, and commits locally.

4. **Push the cask update:**
   ```bash
   git push origin main
   ```
   Users pick up the new version automatically on their next
   `brew upgrade --cask dropshot`.
