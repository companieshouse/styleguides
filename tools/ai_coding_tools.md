# Use of AI Coding Tools and Assistants

The full
[AI Coding Assistants Guidance can be found on Confluence.](https://companieshouse.atlassian.net/wiki/spaces/DEV/pages/5991989283/AI+Coding+Assistants+Guidance)

**Do not use AI Coding tools or assistants that have not been approved for use**
**within Companies House.**

## Skills

> [!WARNING]
> **Do not install skills** to your Companies House device or use skills
> against Companies House data that are not within the
> [@CompaniesHouse/skills repository](https://github.com/companieshouse/skills).
> Installing unapproved skills could lead to security vulnerabilities, data
> breaches, or other issues.

### Writing Skills

If you are developing a skill to be used within Companies House, it must be
added to the
[@CompaniesHouse/skills repository.](https://github.com/companieshouse/skills)

You must adhere to the
[Agent Skills Specification](https://agentskills.io/specification)
when writing new skills. Specifically a skill must be a directory within the
`skills/` directory containing a `SKILL.md` file with the required metadata.
Optionally, the skill can also contain:

* `scripts` - directory containing any scripts required for the skill to function
* `assets` - directory containing any reference materials for the skill,
  for example templates or reference materials for the skill to use when
  performing its function
* `reference` - directory containing files which document the skill's
  functionality, for example a README with instructions on how to use the
  skill or a test file demonstrating the skill's functionality.

All new skills must be approved by the `@CompaniesHouse/AICA-admins` team
before being merged to the main branch.

The `SKILL.md` file must:

* Be in markdown format
* Contain the following metadata in the front matter:

  * `name` - the name of the skill
  * `description` - a description of the skill's functionality

* Be compliant of markdownlint rules
* Contain guardrails against the skill being used in a way that could cause 
  harm, for example by specifying that the skill should not be used with
  sensitive data if it is not designed for that purpose.
* **NOT** contain any malicious code or instructions that could lead to harm
  if the skill is used.
