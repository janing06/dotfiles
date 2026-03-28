Create a pull request for the current branch's changes.

Follow this process:

1. Run `git status`, `git diff`, and `git log --oneline -10` to understand the current state
2. If there are uncommitted changes, stop and tell the user to run `/commit` first
3. If the current branch is `main` or `master`, stop and tell the user: "You're on main — create a feature branch first with `git checkout -b <branch-name>`, then run `/commit` and `/pr` again."
4. Check if the current branch is already pushed to remote — if not, push it with `git push -u origin <branch>`
5. Run `git log main...HEAD` and `git diff main...HEAD` to understand all commits in this branch
6. Draft a PR title (under 70 characters) and body using this format:

```
## Summary
- <bullet points summarizing what changed and why>

## Test plan
- [ ] <manual testing steps>

🤖 Generated with [Claude Code](https://claude.com/claude-code)
```

7. Create the PR with `gh pr create` — pass the body via heredoc to preserve formatting
8. Return the PR URL to the user
