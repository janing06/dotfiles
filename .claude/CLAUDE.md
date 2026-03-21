# Development Guidelines

## Philosophy

### Core Beliefs

- **Simple, elegant, minimal code** - Every line must earn its place, every function must be crystal clear
- **Bug-free over feature-rich** - Correctness trumps complexity, reliability over cleverness
- **Incremental progress over big bangs** - Small changes that compile and pass existing tests
- **Learning from existing code** - Study and plan before implementing
- **Pragmatic over dogmatic** - Adapt to project reality
- **Clear intent over clever code** - Be boring and obvious

### Simplicity Means

- **Minimal viable implementation** - Build only what's needed, nothing more
- **Elegant solutions** - Code that reads like well-written prose
- **Single responsibility per function/class** - Each piece has one clear purpose
- **Zero unnecessary abstractions** - Avoid premature abstractions entirely
- **No clever tricks** - Choose the boring, obvious solution every time
- **Self-documenting code** - If you need to explain it, it's too complex
- **Fewer moving parts** - Less code means fewer bugs

## Workflow

### Researching
- Document research outputs in markdown files organized by topic
- Standalone research tasks: save to `.research/{sensible-directory-name}/`
- Research done as part of brainstorming/design: save alongside the design at `.plan/{sensible-directory-name}/`

### Brainstorming & Design
- Use the `superpowers:brainstorming` skill
- When the design is finalized, document it at `.plan/{sensible-directory-name}/design.md`
- **STOP after writing the design** — do NOT proceed to implementation planning
- Set up the design doc for review (see "Setting Up Docs for Review" below)
- Only proceed with implementation planning after explicit approval

### Implementation Plan Writing
- Write the plan at `.plan/{sensible-directory-name}/plan.md` (same directory as the design)
- Load and use the `superpowers:writing-plans` skill
- If there are frontend-related parts, load relevant frontend skills (e.g., `frontend-design`, `nextjs`, `tailwindcss`, etc.) as appropriate
- Write/update tests first before implementation when tests are necessary (use `superpowers:test-driven-development` skill; skip for super trivial cases)
- Keep implementation simple, elegant, and reasonably robust — KISS, ETC, and YAGNI ruthlessly within reason
- Check quality gates periodically

### Implementation Phase
- Typically invoked via `/subagent-driven-development {path-to-plan}`, but dispatching an agent team is also a viable option when it makes more sense for the task
- Before implementing, read the corresponding `design.md` in the same directory for context on rationale behind decisions
- Follow this loop for each piece of work:
  1. **Understand** - Study existing patterns in codebase
  2. **Test** - Write test first (red) - *skip unless existing tests found or asked to set up a new test suite*
  3. **Implement** - Minimal, elegant code that passes (green) - no excess complexity
  4. **Refactor** - Ruthlessly remove unnecessary code, simplify logic (if applicable)
  5. **Validate** - Run available quality checks (linters, formatters, build scripts, git hooks)
- Use good judgement on when to call a code reviewer — not after every small change, but at meaningful checkpoints
- After the final code review, run the `/simplify` skill on the changes
- After finishing, ask the user if they'd like to review the changes:
  - If they say yes and changes are uncommitted (working tree only): run `code {current-project-path}` to open the directory in Zed
  - If they say yes and changes are committed: run `zdf` on the relevant commit(s) to open the diff in Zed

### When Stuck (After 3 Attempts)

**CRITICAL**: Maximum 3 attempts per issue, then STOP.

1. **Document what failed** at `.gotstuck/{sensible-directory-name}/`:
   - What you tried
   - Specific error messages
   - Why you think it failed

2. **Research alternatives**:
   - Find 2-3 similar implementations
   - Note different approaches used

3. **Question fundamentals**:
   - Is this the right abstraction level?
   - Can this be split into smaller problems?
   - Is there a simpler approach entirely?

4. **Try different angle**:
   - Different library/framework feature?
   - Different architectural pattern?
   - Remove abstraction instead of adding?

5. Set up the documentation for review (see "Setting Up Docs for Review")

### Setting Up Docs for Review
When markdown docs need review (research, design, plan, etc.):
1. Use the `review-doc` skill to open the doc for review
- Do NOT open duplicate panes for the same directory — if a plan is written after a design was reviewed, reuse the existing pane since they share the same directory

## Technical Standards

### Architecture Principles

- **Minimal viable architecture** - Build the simplest thing that works correctly
- **Composition over inheritance** - Use dependency injection
- **Interfaces over singletons** - Enable testing and flexibility  
- **Explicit over implicit** - Clear data flow and dependencies
- **Elegant abstractions only** - Each abstraction must solve a real problem
- **Test-driven when tests exist** - Never disable existing tests, fix them instead
- **Bug prevention over bug fixing** - Design to eliminate entire classes of errors

### Code Quality

- **Every commit must**:
  - Compile successfully
  - Pass all existing tests (if any)
  - Follow project formatting/linting
  - Run available quality checks (build scripts, pre-commit hooks)

- **Before committing**:
  - Run formatters/linters if available
  - Run any build/validation scripts
  - Self-review changes
  - Ensure commit message explains "why"

- **Testing approach**:
  - If tests exist: Include tests for new functionality
  - If no tests exist: Do not introduce testing framework unless explicitly requested

### Error Handling

- Fail fast with descriptive messages
- Include context for debugging
- Handle errors at appropriate level
- Never silently swallow exceptions

## Git & Commit Guidelines

### Committing
- **Never commit automatically** — do not commit on your own initiative
- Wait for the user to explicitly trigger a commit via `/commit`
- Do not bulk-commit all changes at once; commit each logical change separately as the user invokes `/commit`

### Commit Style
- Make atomic commits — not one big commit for all changes
- No need to split a single file across multiple commits

### Commit Message Style
- Match the repository's existing commit message format. Review previous commits and follow the dominant style. For example:
  - If the repo uses **Conventional Commits** (e.g., `feat:`, `fix:`), follow that format.
  - If the repo uses **imperative mood only** (e.g., `Add validation logic`, `Fix crash on load`), follow that instead.
- **Base the commit message on the actual staged changes**, not just the most recent user instruction. Always inspect the staged diff and summarize that accurately.


## Decision Framework

When multiple valid approaches exist, choose based on:

1. **Correctness** - Does this eliminate bugs entirely? Zero tolerance for subtle errors
2. **Simplicity** - Is this the most minimal, elegant solution that works?
3. **Readability** - Will someone understand this instantly, in 6 months?
4. **Testability** - Can I easily test this? (if tests already exist or if there are none, if it would be easy to add tests for it in the future)
5. **Consistency** - Does this match project patterns?
6. **Maintainability** - How hard to change later? Prefer solutions that are easy to modify

## Project Integration

### Learning the Codebase

- Find 3 similar features/components
- Identify common patterns and conventions
- Use same libraries/utilities when possible
- Follow existing test patterns (if any)

### Tooling

- Use project's existing build system
- Use project's test framework (if any)
- Use project's formatter/linter settings
- Don't introduce new tools without strong justification

## Quality Gates

### Definition of Done

- [ ] **Zero bugs** - Implementation is completely correct and robust
- [ ] **Minimal code** - Only essential code remains, no unnecessary complexity
- [ ] **Elegant design** - Solution is obvious and reads naturally
- [ ] Tests written and passing (only if existing test framework found)
- [ ] Code follows project conventions
- [ ] No linter/formatter warnings
- [ ] Available quality checks pass (build scripts, git hooks)
- [ ] Commit messages are clear
- [ ] Implementation matches plan
- [ ] No TODOs without issue numbers

### Test Guidelines (When Tests Exist)

- Test behavior, not implementation
- One assertion per test when possible
- Clear test names describing scenario
- Use existing test utilities/helpers
- Tests should be deterministic

## Important Reminders

**NEVER**:
- Commit automatically — always wait for the user to invoke `/commit`
- Bulk-commit all changes in one go — commit each logical change separately
- Use `--no-verify` to bypass commit hooks
- Disable tests instead of fixing them
- Commit code that doesn't compile
- Make assumptions - verify with existing code

**ALWAYS**:
- Update plan documentation as you go
- Learn from existing implementations
- Stop after 3 failed attempts and reassess
- Remember that using `any` type is not recommended. Only use it as an absolute last resort. Otherwise, use the correct type based on the context
- NEVER EVER REMOVE `.plan/`, `.research/`, or `.gotstuck/` directories
- Do not git add document artifacts in dotfile directories (`.plan/`, `.research/`, `.gotstuck/`, etc.)
