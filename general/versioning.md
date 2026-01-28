# Versioning

This document outlines the versioning scheme used for our software projects to
ensure clarity and consistency in release management.

## Semantic Versioning

We follow Semantic Versioning (SemVer) principles, which use a three-part
version number: MAJOR.MINOR.PATCH. The Semantic Versioning specification can be
found at [semver.org](https://semver.org/).

- **MAJOR** version when you make incompatible API changes,
- **MINOR** version when you add functionality in a backwards-compatible manner,
  and
- **PATCH** version when you make backwards-compatible bug fixes.

This helps explain the changes contained within the release at a glance.
Support teams can use the releases when diagnosing issues, and developers can
understand the impact of upgrading to a new version.

### Examples

- `1.0.0` → `2.0.0`: Major release with breaking changes.
- `1.0.0` → `1.1.0`: Minor release with new features.
- `1.0.0` → `1.0.1`: Patch release with bug fixes and minor improvements.

## Pre-release Versions

Pre-release versions are versions of a service/library which are not yet stable
and may contain breaking changes. This is typically services which are still in
beta or alpha stages of the GDS Software Development Life Cycle (SDLC).

We use version `0.x.y` for pre-release versions where `x` and `y` indicate the
minor and patch levels respectively. Pre-release versions are not considered
stable and may contain breaking changes.

When the version changes to `1.0.0`, it indicates the first stable live release
of the software.

## When should I increment the version?

- Increment the **MAJOR** version when you introduce changes that break
  backward compatibility.
- Increment the **MINOR** version when you add complete new features or
  functionality that do not break backward compatibility.
- Increment the **PATCH** version when you fix bugs or make minor improvements
  that do not affect the API.

## How to increment the version

Typically our version numbers are managed via the `version` file within the
source. This will contain the major and minor version only, e.g. `1.2`. The
patch version is then incremented automatically as part of the CI/CD release
process.

When making changes that require a version increment, update the `version` file
accordingly and ensure that the CI/CD pipeline is configured to handle the
patch version increment during releases.
