Make one atomic git commit for a single logical change — do NOT bulk-commit everything at once.

Follow this process:

1. Run `git status` and `git diff` to understand what has changed
2. Run `git log --oneline -10` to learn the repo's commit message style
3. Identify one logical unit of change to commit (not all changes at once)
4. Stage only the files belonging to that logical unit
5. Do NOT stage files in `.plan/`, `.research/`, or `.gotstuck/` directories
6. Write a commit message that matches the repo's style and explains the "why"
7. Commit — do not use `--no-verify`
8. If more logical units remain uncommitted, let the user know and wait for them to invoke `/commit` again
