# Day 34 – Git Post-Update Hook for Release Tagging (Nautilus)

## 🔧 Task

The Nautilus application development team is working with a Git repository located at `/opt/games.git` (bare repo), cloned under `/usr/src/kodekloudrepos/games`.

**Requirements:**

- Merge the `feature` branch into the `master` branch.
- Create a `post-update` hook in `/opt/games.git/hooks/` so that whenever changes are pushed to `master`, a release tag with today’s date is created.
  - Example: `release-2025-09-10`
- Test the hook at least once by pushing the `master` branch.
- Verify that the release tag is created.

## 🖥️ Target Server

- Hostname: `ststor01.stratos.xfusioncorp.com`
- IP: `172.16.238.15`
- User: `natasha`
- Repo: `/opt/games.git` (bare), clone at `/usr/src/kodekloudrepos/games`

## 📌 Notes

- Git hook scripts must be executable.
- Tags should follow the format `release-YYYY-MM-DD`.
- Use `git fetch --tags` and `git tag -l` to verify tags.
- The `post-update` hook runs after a successful `git push` to the bare repository.
