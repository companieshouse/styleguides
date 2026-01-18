# Pull Request Standards

These standards exist to make pull requests easy to review, easy to search,
and safe to merge.

## Title

* **Must start with a `UAR-XXXX` prefix** (where `UAR` corresponds to your
project code and `XXXX` is the relevant ticket item)
* Should be a short description of the purpose of the pull request
* Keep it to around **50 characters**
* Capitalise the first character after the prefix
* If we look at the titles of all pull requests between two points in time
  (e.g. two releases), they should clearly describe what has changed

**Example:**

```
SCRS-402 Add PSC summary page with director details
```

---

## Body

* Provide detail on what the pull request is doing
  *For small PRs, the title may be enough*
* Wrap each line at around **72 characters** (GitHub will not do this for
you)
* Add any relevant links (e.g. related pull requests or documentation)
* Do not rely solely on ticket links — include enough context to understand
  the change
* Add related tickets at the bottom under a **"Resolves"** section
* `@mention` anyone you specifically want to review it
* Do not assume reviewer familiarity with the change
* Consider the audience — reviewers may not always be deeply technical
* Treat all repositories as **public/open source**
  * Be mindful of language and sensitive information in commits and PRs

---

## Example

```
SCRS-402 Add PSC Summary page with Director Details

This is a new page for a PSC Summary. It uses Director details for the PSC.

* All details gathered previously in the journey for director prepopulate
  the PSC fields.
* Two nature of controls get automatically set to the PSC.
* The only field validation is a checkbox at the bottom, noting agreement.

Related concordion PR:
companieshouse/concordion-webincs#13

Resolves:
SCRS-402, SCRS-405, SCRS-407
```

## Checklist

Before creating or submitting a pull request, run through this checklist:

1. **Correct base branch**
   * Check you are merging into the correct branch.
   * A large number of changed files may indicate the wrong base branch.
2. **No merge conflicts**
   * Ensure your branch has pulled in the latest `develop`.
3. **Feature notes updated**
   * Include any important information such as:
     * External dependencies
     * Database patches
     * Configuration changes
4. **All tests pass**
   * All acceptance and automated tests must pass before submission.
5. **Is it as small as it can be?**
   * If the diff feels large, it probably is.
   * Large PRs will be rejected and must be split into smaller ones.
6. **Linked external pull requests**
   * Add links to related PRs to avoid missed dependencies.
7. **Correct labels applied**
8. **Clear scope**
   * Explicitly list what is included in the pull request.
9. **Code adheres to repository standards**
   * Follow all applicable coding and security guidelines.

## Merge Strategy & Branch Deletion

**Choose the merge strategy that best preserves value:**
 
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


* **Branch deletion:**

  * Delete the source branch **after a successful merge**
  * This applies to both feature and bugfix branches
  * Long-lived branches should be avoided unless explicitly agreed


## Pull Requests into `develop`

Additional considerations when reviewing pull requests into `develop`
(the integration/staging branch):

1. **Do not approve work from your own team**

   * You may review and comment, but final approval must come from outside
     the team.
     
2. **Ensure sufficient expertise**

   * Only approve if you have adequate knowledge of the area being changed.

3. **Consider wider impact**

   * Assess whether the pull request could block or negatively affect other
     work streams.


**Summary**

* Use the `UAR-XXXX` format in every PR title
* Keep PRs small and well-described
* Squash and merge
* Delete branches after merging

