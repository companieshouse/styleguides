# Feature Flag Guidelines

**Before adding a feature flag you should read this helpful article on the topic.**
https://martinfowler.com/articles/feature-toggles.html

## Best practises

* The feature flag name should be descriptive and tell people what the flag does before they look for it in the code.
* The feature flag name should include a prefix that is both searchable and relevant. The shorter the prefix the harder this will be to search for in our code base. i.e. `FF` is a poor prefix as it is the hexadecimal for 255 a common number in development.
* The feature flag should contain a creation date in the following format `ddmmyy` as a suffix.
