# Feature Flag Guidelines

**Before adding a feature flag you should read**
**[this](https://martinfowler.com/articles/feature-toggles.html)**
**helpful article on the topic.**

## Best practises

### Naming

* The feature flag name should be descriptive and tell people what the flag
  does before they look for it in the code.
* It should include a prefix that is both searchable and relevant. The shorter
  the prefix the harder this will be to search for in our code base. i.e. `FF`
  is a poor prefix as it is the hexadecimal for 255 a common number in
  development.
* Feature flags **must** be prefixed with `FEATURE_FLAG_` which is already
  used by a number of our code repositories.
* The feature flag should contain a creation date in the following format
  `ddmmyy` as a suffix.
* Avoid using dots in the name where possible as they cause problems on
  Windows based machines.

#### Examples

* `FEATURE_FLAG_FIVE_OR_LESS_OFFICERS_JOURNEY_21102021`
* `FEATURE_FLAG_COMPANY_STILL_REQUIRED_11032021`

### Usage

* The feature flag **must** be removed once the behaviour becomes accepted.
* You should create a story to remove the eature flag at some point in the
  future when it is introduced. This ensures the work is visible and is
  not forgotten about.
* Note that some feature flags may not only be used for 'under construction'
  work and have a much longer shelf-life (e.g. those to control access to logic
  implemented for Covid-19) or indeed be permanent.
* Liaise with support about how the flag should be used.
* Values for LIVE environments should be specified in Release Notes. Values for
  other environments should be set in Docker config files.

### Techniques

Prefer abstraction over if...then...else... statements

For more information on abstraction vs conditional statements see the
"Implementation" sections
[here](https://trunkbaseddevelopment.com/feature-flags/#implementation) and
[here](https://martinfowler.com/articles/feature-toggles.html#ImplementationTechniques).
