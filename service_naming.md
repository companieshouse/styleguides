# CHS Service Naming

This page defines the naming standards for services being deployed to CHS and their github repositories.

**This standard is applicable to new projects only. There is no requirement to rename existing projects.**

## Background

The standard is required because current naming standards are not uniform and are not always expressive enough to fully describe what a
service is responsible for. e.g. Data Sync has a design for an insolvency-api to manage insolvency data in MongoDB, but there is already an
insolvency-api which handles the submission of insolvencies.

## The Standard
The naming standard for CHS projects can be expressed as

`[data_type]?-[discriminator]?-[service_type]`

where:

- `data_type` is the name of the data type being processed e.g. insolvency, charges. Optional for global services.
- `discriminator` describes what this service does for the data type. Optional.
- `service_type` describes the type of service e.g. web, api.

### Data Type
The names of the data being processed should be consistent. Here is a list of common data types based on the on the public CHS API. NB This
list is not definitive - other data types are acceptable.

- officer
- register
- company_profile
- charges
- filing_history
- insolvency
- exemptions
- officer_disqualifications
- officer_appointments
- uk_establishments
- psc

Services that do not process a single data type can drop the data_type.

### Service type
The service type may be used to influence the build process. Common service types include the following:
- web - web app
- api - a service that provides access to data via APIs
- consumer - a service that imports|reads|consumes data
- producer - a service that exports|writes|produces data
- library - code library that will be included in services, not a service in its own right
- prototype, development, specification - non-production services|repos

**This list is not definitive.**

### Discriminators
The discriminator is optional but is intended to provide a bit more detail when there may be more then one data-service combination e.g.
insolvency-*data*-api, insolvency-*submission*-api, both provide APIs for Insolvency but for different purposes.

## Examples
A list of some existing/proposed services and their suggested names under this standard. **(NB We will not be renaming existing services).**

| Existing/Proposed | These Guidelines | 
| --- | --- |
| chs-delta-api | delta-api |
| officer-delta-processor | officer-appointments-delta-consumer |
| company-appointments.api.ch.gov.uk | officer-appointments-data-api |
| insolvency-api (data sync) | insolvency-data-api |
| insolvency-api (submissions) | insolvency-submission-api |
| confirmation-statment-api | confirmation-statement-submission-api |
| payments.admin.web.ch.gov.uk | payments-admin-web |
| user.web.identity.ch.gov.uk | user-identity-web |
| chips-image-service | chips-image-producer |
| image-redaction-inbound | image-redaction-consumer |
| chs-email-sender | email-producer |