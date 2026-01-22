# Branch Naming Standards

These standards exist to keep branches consistent,
searchable, and easy to reason about across teams
and tooling.

## General Rules

* **Lowercase only**: `a–z`, digits `0–9`, `/`, and `-`
* **No spaces** — use `-` as the word separator
* **Do not include** the hash character `#`
* **Always include the ticket ID** (lowercase)
* **Always include a short, meaningful description**
  (avoid vague terms like `misc`, `fixes`, `updates`)
* Branches **may be prefixed like a URI**, including
optional team or project subpaths

## Approved Branch Prefixes & Formats

> Note: `uar-1234` in these examples is a placeholder — you must use the
> Jira project key associated with your repository.

### Feature Branches

Used for new functionality.

```md
feature/[<team-or-project>/]<ticket-id>-<short-description>
```

Example

```md
feature/chips/uar-1234-new-eligibility-check
```

### Bugfix Branches

Used for defect fixes.

```md
bugfix/[<team-or-project>/]<ticket-id>-<short-description>
```

Example

```md
bugfix/idv/uar-1234-null-pointer-on-login
```

### Release Branches

Used for versioned releases.

```md
release/x.y.z
```

Example

```md
release/1.3.0
```

### Integration / CI Branches (Temporary)

Used for CI or integration testing.
These **must mirror their parent feature branch path** and
append `/ci`.

```md
feature/**/ci
```

Example

```md
feature/rice/uar-1234-new-eligibility-check/ci
```

## Notes

* Ticket IDs are **mandatory** for feature and bugfix branches
* Descriptions should be short but specific
* Consistent naming improves tooling, automation, and
cross-team collaboration
