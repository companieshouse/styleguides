# Commit Standards

Commit messages are part of your code’s documentation — they explain **why**
a change exists, not just what changed. Keep messages short, focused and
useful for reviewers and future readers.

## Unifed format (required)

### Subject line (required)

`PROJ-1234: Short imperative summary (≤50 chars)`

* Must begin with the Jira issue key for this repo (e.g. `PROJ-1234`).
* Use **imperative mood**: `Add…`, `Fix…`, `Update…`.
* Aim for **≤50 characters** in the subject.

> Note: `PROJ` in these examples is a placeholder — you must use the
> Jira project key associated with your repository.

### Body (optional but recommended for non-trivial changes)

* Separate the body from the subject with a single blank line.
* Wrap lines at **~72 characters**.
* For anything beyond a trivial change, answer these three questions:

  1. **Why** is this necessary?
  2. **How** does it address the issue? (omit for very small changes)
  3. **What effects** does it have? (side effects, benchmarks,
     migrations, etc.)

### References / Footer

At the bottom include references to issues/stories using the Jira keys:

```md
Resolves: PROJ-123
See also: PROJ-456, PROJ-789
```

## Unified workflow (development & merging)

### During development

* Make **small, focused commits**. Keep refactors, whitespace, and
  functional changes separate.
* Use `git commit --amend` to polish the *current* local commit, but
  **do not** rewrite published/shared history.

### Before merging

Choose the merge strategy that best preserves value:

* **Squash merge**

  Good for PRs with many small or interim commits. If you squash,
  ensure the *final commit message* (the squashed commit) includes the
  subject and a body that answers the three questions above.

* **Merge commit**
  
  Use when individual commits represent distinct, meaningful changes
  and preserving those commits helps traceability.

* **When to preserve commits**
  
  Preserve commits that represent distinct changes worth keeping
  (refactors, separate features/fixes). Squash only when intermediate
  commits provide no lasting review or trace value.

### Shared-branch rules

* Avoid rewriting public/shared branch history. If others may have
  pulled the branch, **do not** rebase or force-push to change its
  history.

## Commit structure - quick checklist

* ✅ Starts with a Jira key and colon: `PROJ-1234: …`
* ✅ Subject in imperative mood, ≤50 chars preferred
* ✅ Blank line between subject and body (if body present)
* ✅ Body wraps at ~72 chars and answers the three questions when
  relevant
* ✅ Footer includes Jira references (`Resolves: PROJ-123`)
* ✅ Separate whitespace/refactor/functional changes into separate commits

## Things to avoid

* **Mixing whitespace with functional changes.** Make separate commits.
* **Mixing unrelated functional changes.** Keep unrelated work in
  separate commits/PRs.
* **Single giant commit for a large feature.** Break into reviewable
  pieces; keep refactors separate from functional additions.
* **Relying solely on links.** Don’t hide behind issue links — include
  enough detail in the commit message that a reviewer understands the
  purpose without opening Jira.

## Example

```md
IDV-1234: Add export-to-csv for user reports

Why:
This allows users to download filtered report data for offline analysis
and integrates with our analytics workflow.

How:
Adds an `ExportCSV` service and new controller endpoint; the CSV writer
uses streaming to avoid large memory usage.

Effects:
- Adds an endpoint: `GET /reports/export?filter=...`
- Migration: none
- Benchmarks: exports ~10k rows in ~400ms on staging

Resolves: IDV-1234
See also: IDV-2345, IDV-6789
```
