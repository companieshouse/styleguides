# Environment Variables Guidelines

Micro services should be following [12 Factor App](https://12factor.net)
principles and reading their configuration from environment variables.

## Reading environment variables

### Java applications

Teams may choose to use either Spring or the Companies House
[environment-reader-library](https://github.com/companieshouse/environment-reader-library)
library. They should be consistent in their choice for all the micro services
that form a coherent group.

It is recommended that Spring Boot projects use application.properties to
refer to environmental variables so they can be used by Spring features such as
SPEL expressions.

How to use Spring application configuration is provide in the
[Spring documention for external configuration](https://docs.spring.io/spring-boot/docs/1.5.6.RELEASE/reference/html/boot-features-external-config.html)

## API Key Naming

> [!IMPORTANT]
> This is a mandatory standard. Consistent naming simplifies the management,
> auditing, and rotation of API keys across all CHS services.

<!-- markdownlint-disable-next-line MD028 -->
> [!NOTE]
> This section may be expanded into dedicated API key management guidance in
> future, covering areas such as key rotation, storage, and secret management
> practices.

All environment variables that hold API keys **must** follow the naming
convention below, using the appropriate prefix for the key's origin:

### Format

```text
{PREFIX}_{SERVICE_NAME}_API_KEY
```

### Prefixes

| Prefix | Usage |
|---|---|
| `CHS_INTERNAL_` | CHS services **not** accessible to the public — only available to internal CHS consumers |
| `CHS_EXTERNAL_` | CHS services accessible via the public-facing CHS API |
| `GOVUK_` | GOV.UK platform services (e.g. GOV.UK Notify, GOV.UK Pay) |
| `{VENDOR}_` | Third-party commercial services — use the vendor name as the prefix |

The `INTERNAL`/`EXTERNAL` qualifier applies only to `CHS_` prefixed keys and
describes whether the API being consumed is private to CHS or publicly
accessible.

### Examples

| Variable | Description |
|---|---|
| `CHS_INTERNAL_PAYMENTS_API_KEY` | Key for the internal CHS Payments API |
| `CHS_EXTERNAL_COMPANY_SEARCH_API_KEY` | Key for the publicly accessible Company Search API |
| `GOVUK_NOTIFY_API_KEY` | Key for GOV.UK Notify |
| `GOVUK_PAY_API_KEY` | Key for GOV.UK Pay |
| `STRIPE_API_KEY` | Key for Stripe (third-party) |
