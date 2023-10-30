# Commit Standards

Commit messages should be considered an integral part of the development
process, its the best way to communicate the context of a change, a diff can
tell you what changed but a commit message can tell you **why**.

Your commit messages should answer 3 questions:

1. Why is it necessary?
    * It may fix a bug, it may add a feature, it may improve
      performance, reliabilty, stability, or just be a change for the sake
      of correctness.

2. How does it address the issue?
    * For small changes this part can be omitted, but it should be a high
      level description of what the approach was.

3. What effects does the commit have?
    * This may include benchmarks, side effects etc

A commit is basically constructed of:

1. A one line brief summary (50 characters or fewer), this will be used as
  a commit title of sorts.
    * What the commit does
    * Use imperative mood here i.e. "fix a missing dictionary code for title"
      instead of "fixes a missing dictionary code for title", you should be
      able to complete the following sentence -
      `If applied, this commit will <insert summary here>`

2. A body which gives more details (if required)
    * Should answer the 3 questions mentioned above
    * Give as much relevant detail as possible
    * The lines should wrap at around 72 characters

## Example

```md
Summarize changes in 50 characters or less

More detailed explanatory text, if necessary. Wrap it to about 72
characters or so. In some contexts, the first line is treated as the
subject of the commit and the rest of the text as the body. The
blank line separating the summary from the body is critical (unless
you omit the body entirely).

Explain the problem that this commit is solving. Focus on why you
are making this change as opposed to how (the code explains that).
Are there side effects or other unintuitive consequences of this
change? Here's the place to explain them.

Further paragraphs come after blank lines.

 - Bullet points are okay, too

 - Typically a hyphen or asterisk is used for the bullet, preceded
   by a single space, with blank lines in between, but conventions
   vary here

Put references to any issues/stories you are resolving at the bottom,
like this:

Resolves: #123
See also: #456, #789
```

## Things to avoid

* **Mixing whitespace changes with functional code changes** - The whitespace
  changes will obscure the important functional changes, making it harder for
  a reviewer to correctly determine whether the change is correct. The
  solution to this is to create 2 commits, one with the whitespace changes,
  one with the functional changes. Typically the whitespace change would be
  done first, but that need not be a hard rule.
* **Mixing two unrelated functional changes** - Again the reviewer will find
  it harder to identify flaws if two unrelated changes are mixed together. If
  it becomes necessary to later revert a broken commit, the two unrelated
  changes will need to be untangled, with further risk of bug creation.
* **Sending large new features in a single giant commit** - It may well be the
  case that the code for a new feature is only useful when all of it is
  present. This does not, however, imply that the entire feature should be
  provided in a single commit. New features often entail refactoring existing
  code. It is highly desirable that any refactoring is done in commits which
  are separate from those implementing the new feature. This helps reviewers
  and test suites validate that the refactoring has no unintentional functional
  changes. Even the newly written code can often be split up into multiple
  pieces that can be independently reviewed. For example, changes which add new
  internal APIs/classes, can be in self-contained commits. Again this leads to
  easier code review. It also allows other developers to cherry-pick small
  parts of the work, if the entire new feature is not immediately ready for
  merge.
* **Hide behind the fact that there are links to stories** -  It may be
  tempting to not put any detail in your commit message because there are links
  to jira, while adding these links is useful there should be enough detail in
  a commit message that a reviewer knows what the commit is doing.
