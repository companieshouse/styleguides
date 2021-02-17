# Environment Variables Guidelines

Micro services should be following [12 Factor App](https://12factor.net) principles and reading their configuration from environment variables.
## Reading environment variables

### Java applications
Teams may choose to use either Spring or the Companies House [environment-reader-library](https://github.com/companieshouse/environment-reader-library) library