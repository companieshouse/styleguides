# CHIPS development guidelines

## General

Avoid using deprecated methods, both in the CHIPS code and third-party packages
to avoid work in the future.

Use the **uk.gov.ch.chips.common.util.DateUtils** class to generate Dates.
Avoid using new Date() in favour of DateUtils.today() and try to use methods in
that class where possible.

## Formatting

New code should follow the Company House standard, however the reformatting of
whole existing classes is not recommended because it makes reviewing the
code more complicated.

## Packages

Don't add classes to the **uk.gov.ch.cap** package. The package was created for
a specific legal change and is no longer current. Refactoring of existing classes
needing modified to move them from cap to chips should be considered
on a case-by-case basis.

## Rule configuration

The rules in the CSV configuration should be ordered by rule bean name to make
finding the entry as easy as possible.

## Testing

### Unit tests

Use **Mockito** for mocking classes.
Test classes using Easymock should be converted when worked on.

Use **org.hamcrest.MatcherAssert.assertThat** instead of
AssertTrue where that makes the code clearer.

When working with CHIPS Rules please use the assertions provided of appropriate.

The assert methods run the rule as represented by the testRule instance variable and check the number of issues found.

| Method                                        | Description                                                                                       |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------|
| assertExpectedIssuesMatches(int expectedIssues) | 	Run testRule and assert that the number of issues generated matches the value of expectedIssues. |
| assertZeroIssues()	                           | Run testRule and assert that the number of issues generated is 0.                                 |
| assertOneOrMoreIssues()                       | 	Run testRule and assert that the number of issues generated is > 0.                              |

### Integration tests

Integration tests for Data Access Object (DAO) classes that interact with the database are required.

### Minimum coverage

The minimum test coverage for new code is 80%.

## Spring

Use **JdbcTemplate.queryForObject()**,
not **JdbcTemplate.queryForLong()** or **JdbcTemplate.queryForInt()**
because these methods are deprecated.

Do not use the Spring **HibernateTemplate** because this is deprecated;
instead use calls to Hibernate **Session**.
