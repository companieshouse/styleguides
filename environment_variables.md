# Environment Variables Guidelines

Micro services should be following [12 Factor App](https://12factor.net) principles and reading their configuration from environment variables.
## Reading environment variables

### Java applications
Teams may choose to use either Spring or the Companies House [environment-reader-library](https://github.com/companieshouse/environment-reader-library) library. They should be consistent in their choice for all the micro services that form a coherent group.

How to use Spring application configuration is provide in the [Spring documention for external configuration](https://docs.spring.io/spring-boot/docs/1.5.6.RELEASE/reference/html/boot-features-external-config.html)