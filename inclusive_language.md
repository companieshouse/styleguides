# Inclusive Language Policy

This document will outline how software development teams at Companies House
can ensure that code and documentation is written with diversity and inclusion
in mind.

It is not definitive and is likely to be updated as best practices evolve.

## Applicability

This policy applies to anyone contributing to Companies House code or
documentation in public or private repositories.

## Introduction

Companies House embraces diversity and promotes inclusion and equality of
opportunity.

Language plays a critical role in fostering an inclusive environment and as
such, the language used in the documentation and code managed by our software
development teams should reflect these values also.

We should avoid use of language that is discriminatory, condescending or where
it might represent:

- Age bias
- Culture bias
- Disability bias
- Ethnic slurs
- Gender bias
- Gender-specific language
- Racial bias
- Sexual orientation bias

Some terminology might be normalized on the technical level but loaded at
societal level. As such, we should avoid referring to people using divisive
wording and avoid using loaded terminology where unnecessary to describe
technical concepts. Examples include:

<!--alex disable blacklist sanity-check whitelist dummy-->
- master/slave
- blacklist/whitelist
- sanity check
- dummy
<!--alex enable blacklist sanity-check whitelist dummy-->

## Application in new projects

All new documentation and code should be inclusive and facilitate diversity.
Contributing authors are strongly encouraged to use neutral terms and avoid
exclusionary language, to ensure the most inclusive environment possible.

A link to this policy should be provided from the CONTRIBUTING.md file (where
applicable).

### Default branch naming on GitHub (new projects)

Newly created repositories automatically set main as the default branch.

## Application in existing projects

When working in an existing codebase, teams should be alert to opportunities to
update the language used in documentation and code. A link to this policy
should be provided from the CONTRIBUTING.md file at the same time (where
applicable).

## Checking code

Currently, the best way to check you are using inclusive language in your code
is to search for known offending terminology.

<!--alex disable blacklist whitelist-->
For example, you might search code locally for use of the words master, slave,
blacklist or whitelist using a regular expression:
<!--alex enable blacklist whitelist-->

`((black|white)[_-]?(list)+)|master|slave`

## Other tools

In Microsoft Office it is possible to enable writing style checks for inclusive
language. Exactly how you find the setting depends on the version but it is
typically under options for grammar and proofing. Again, depending on your
version, you might only be able to enable checks on gender bias. Newer versions
will offer many more. As this is a setting for MS Office, you will benefit
from the checks across the suite, including Outlook.

Microsoft Teams has a feature called `Speaker Coach` which can listen to what
you are saying in meetings and give you a report on how well you have spoken
including whether you have been inclusive. While not 100% it does pick up on
things which may help provide points for reflection and personal improvement.

Checking for bias in job adverts with <https://joblint.org/>.

## Further reading

- [Inclusive Naming Initiative](https://inclusivenaming.org/)
- The IETF (Internet Engineering Task Force) have collated a list of terms with
  [suggested alternatives](https://github.com/ietf/terminology).
- Article by NCSC (National Cyber Security Centre UK) on
  [their changes](https://www.ncsc.gov.uk/blog-post/terminology-its-not-black-and-white).
- Some background context on Terminology, Power and Oppressive Language, in a
  [draft submitted to the IETF](https://tools.ietf.org/id/draft-knodel-terminology-04.html).
- Specific guidance on documenting accessibility
  [by Google](https://developers.google.com/style/inclusive-documentation#about-disability-and-accessibility).

This policy has been modified based upon the Inclusive Language policy at
[UK Hydrographic Office (UKHO)](https://github.com/UKHO/docs/blob/main/software-engineering-policies/InclusiveLanguage/InclusiveLanguagePolicy.md).
