# Feature Flag Guidelines

**Before adding a feature flag you should read**
**[this](https://martinfowler.com/articles/feature-toggles.html)**
**helpful article on the topic.**

At Companies House we use feature flagging to enable us to deliver features
without modifying the current behaviours of the system. This may be because
the features are still being developed or the functionality
may only become active at a certain date. Feature flags support our development
practice of trunk-based development, where features are built up on the main
branch over time as opposed to larger feature branches which result in harder
code reviews and more maintenance. Other flags may be semi-permanent and may be
used to toggle functionality on/off as
needed (e.g. in response to a live support issue). These are referred to as Operational (Ops) feature flags.

The following documentation details how feature flags should be used and
managed.

## Best practices

### Naming

* The feature flag name should be descriptive and tell people what the flag
  does before they look for it in the code.
* Feature flags **must** be prefixed with `FEATURE_FLAG_`.
* Operational feature flags **must** be prefixed with `OPS_FEATURE_FLAG_`.
* The feature flag should contain a creation date in the following format
  `ddmmyy` as a suffix.
* Do not use dots in the name as they cause problems on Windows based machines.
* Ops feature flag naming convention adopted in November 2023. Older Ops flags should be renamed wherever possible.

#### Examples

* `FEATURE_FLAG_FIVE_OR_LESS_OFFICERS_JOURNEY_211021`
* `FEATURE_FLAG_COMPANY_STILL_REQUIRED_110321`

### Usage

#### For work in CHIPS

CHIPS has its own guidance in
[Confluence](https://companieshouse.atlassian.net/wiki/spaces/DEV/pages/100238110/CHIPS+feature+flagging)
However, where possible follow the naming advice above.

#### For work relating to features under development/to be enabled on a date

* The feature flag **must** be removed once the feature is deemed to be
  working.

  For example, it may be necessary to leave the feature in LIVE for a few
  weeks and observe whether the feature has been triggered and to assess the
  outcome.

  The flag **must** be removed prior to the team downing tools on the project.
  Leaving feature flags around increases risk, increases the maintenance
  burden and increases the work for others to maintain the application.
* You should create a story to remove the feature flag at some point in the
  future when it is introduced. This ensures the work is visible and is
  not forgotten about.
* When adding a new feature flag to an application which already has
  feature flags, consider whether you can remove the old feature flags
  applying the principle of leaving things tidier than when you found them
  (known as the
  [scouting rule](https://auth0.com/blog/a-scout-approach-to-software-development/)).

#### Operational Feature flags not bound to features under development (i.e. semi-permanent flags)

* Note that some feature flags may not only be used for 'under construction'
  work and have a much longer shelf-life (e.g. those to control access to logic
  implemented for Covid-19) or indeed be permanent.
* Liaise with support about how the flag should be used.
* Values for LIVE environments should be specified in Release Notes. Values or
  the Terraform configuration within the project repository for
  other environments should be set in Docker config files.

### Techniques

Prefer abstraction over if...then...else... statements

For more information on abstraction vs conditional statements see the
"Implementation" sections
[here](https://trunkbaseddevelopment.com/feature-flags/#implementation) and
[here](https://martinfowler.com/articles/feature-toggles.html#ImplementationTechniques).
