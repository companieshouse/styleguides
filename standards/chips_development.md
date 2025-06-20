# CHIPS Development Guidelines

## General

- To reduce future maintenance work, avoid using deprecated methods - both in
CHIPS code and third-party packages.
- Use the `uk.gov.ch.chips.common.util.DateUtils` class for generating
dates.
- Avoid `new Date()`; prefer `DateUtils.today()`.
- Use methods in `DateUtils` where applicable.

## Formatting

- New code should follow the Companies House standard.
- Avoid reformatting entire existing classes, as this can complicate code
reviews.

## Packages

- **Do not** add classes to the `uk.gov.ch.cap` package.
- This package was created for a specific legal change and is no longer in
active use.
- Refactor existing classes from `cap` to `chips` **case by case**, when
modifying them.
- If refactoring of existing classes in the cap package is needed, consider
refactoring and moving them to CHIPS, with this decision made on a case-by-case
basis.

## Rule Configuration

- Rules in the CSV configuration file should be **ordered by rule bean name**
to simplify lookup.

## Testing

### Unit Tests

- Use **Mockito** for mocking classes.
- Convert test classes using **EasyMock** to Mockito when modifying them.
- Prefer `org.hamcrest.MatcherAssert.assertThat` over `assertTrue` when it
makes the code clearer.
- When testing CHIPS Rules, use the provided assertion methods where
appropriate.

#### Assertion Methods

These methods operate on the `testRule` instance variable and verify the number
of issues detected:

- `assertExpectedIssuesMatches(int expectedIssues)`
Asserts that the expected number of issues is generated.

- `assertZeroIssues()`
Asserts that zero issues are generated.

- `assertOneOrMoreIssues()`
Asserts that one or more issues are generated.

### Integration Tests

- Data Access Object (DAO) classes that interact with the database **must**
include integration tests.

- These tests are located in: `server/test/it/src`
- They should be subclasses of `AbstractSpringContextPersistenceTest`

### Minimum Coverage

- New code must have **at least 80% test coverage**.

## Spring

- Use `JdbcTemplate.queryForObject()`,
**do not** use `JdbcTemplate.queryForLong()` or
`JdbcTemplate.queryForInt()` - these methods are deprecated.

- **Avoid** using Spring's `HibernateTemplate` (deprecated).
Use Hibernate `Session` methods instead.
