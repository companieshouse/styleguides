# Git Best Practices

This page brings together the Git practices we use across IT Services.

The aim is to keep things consistent and make changes easier to follow and
review. More detailed guidance is linked in each section below.

## Branches

Follow the existing [Branch Naming Standards](branches.md) when creating a
branch.

Branch names should make it clear what the work is for. Use the appropriate
prefix, include the Jira ticket ID and add a short description of the change.

For example:

```md
feature/chips/uar-1234-new-eligibility-check
```

Avoid vague names such as `fix`, `updates` or `misc`. Someone looking at the
branch should be able to get a reasonable idea of what it contains.

Feature and bugfix branches must include the relevant Jira ticket ID.

For temporary CI or integration work, mirror the parent feature branch and
append `/ci`.

## Commits

Follow the [Commit Standards](commits.md) for commit messages.

Keep commits small and focused where possible. A commit should cover one
logical change rather than several unrelated changes grouped together.

Commit messages should explain why the change was made, not only what files
were changed.

Use the standard format:

```md
PROJ-1234: Add alerting for failed backups
```

Start with the Jira issue key and use a short, imperative summary such as
`Add`, `Fix` or `Update`.

For larger changes, add a commit body with enough detail to explain:

* why the change is needed
* how it addresses the issue
* any effects or side effects worth knowing about

Keep refactors, formatting and functional changes separate where possible.
This makes the history easier to follow and changes easier to review.

Do not rewrite shared branch history. If others may already have pulled the
branch, avoid rebasing or force pushing it. Use a pull request when changes
are needed on a shared branch.

## Pull Requests

Follow the [Pull Request Standards](pull-requests.md) when raising a pull
request.

Keep pull requests focused and as small as reasonably possible. The
description should give reviewers enough context to understand the change
without having to rely entirely on the Jira ticket.

Before raising a pull request, check:

* the correct base branch is selected
* the branch is up to date
* there are no merge conflicts
* tests and automated checks are passing
* the scope of the change is clear
* any relevant documentation has been updated
* related tickets or pull requests are linked
* the correct labels have been added
* the version has been updated where needed

Pull request titles should include the relevant Jira ticket ID followed by a
short description.

For example:

```md
SCRS-402 Add PSC summary page with director details
```

Treat repositories as public and be mindful of language and sensitive
information in commits and pull requests.

## Reviews

Use the GitHub `Reviewers` section when asking for a review rather than
relying only on `@mentions`.

Choose reviewers based on relevant knowledge or code ownership and give them
enough context to understand the change.

Only approve a change if you have adequate knowledge of the area being
changed. Consider whether the change could block or negatively affect other
work streams.

For repositories using an integration or staging branch, follow the wider
review requirements in the [Pull Request Standards](pull-requests.md).

## Merging

Choose the merge approach based on the changes in the pull request.

Use a squash merge when the branch contains small or interim commits that do
not add useful review or trace value.

Use a merge commit when individual commits represent distinct, meaningful
changes that are useful to preserve.

If commits are squashed, make sure the final commit message follows the
[Commit Standards](commits.md).

Delete feature and bugfix branches after a successful merge. Long-lived
branches should be avoided unless explicitly agreed.

## Repository Hygiene

Keep repositories tidy and easy to navigate.

Avoid:

* committing generated files unless they are needed
* committing local environment files
* leaving stale branches around
* adding large files without agreement
* duplicating existing documentation
* unclear file or directory names
* mixing unrelated changes in one pull request

Update documentation when a change affects how a service is built,
configured, deployed or supported.

## In Short

* Use clear and consistent branch names
* Include the relevant Jira ticket ID
* Keep commits small and focused
* Do not rewrite shared branch history
* Give reviewers enough context
* Keep pull requests manageable
* Choose reviewers with suitable knowledge
* Preserve commits that provide useful trace value
* Delete feature and bugfix branches after merging
* Keep repositories tidy
