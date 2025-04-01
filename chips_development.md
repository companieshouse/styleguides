# CHIPS development guidelines

## General

Avoid using deprecated methods, both in the CHIPS code and third-party packages to avoid work in the future.

Use the **uk.gov.ch.chips.common.util.DateUtils** class to generate Dates. 
Avoid using new Date() in favour of DateUtils.today() and try to use methods in that class where possible.

## Formatting

New code should follow the Company House standard, however the reformatting of whole exiting classes is not
recommended because it makes reviewing the code more complicated.  

## Packages

Don't add classes to the **uk.gov.ch.cap** package. The package was created for a specific legal change and 
is no longer current. Refactoring of existing classes needing modified to move them from cap to chips should
be considered on a case-by-case basis.

## Rule configuration

The rules in the CSV configuration should be ordered by rule bean name to make finding the entry as easy
as possible.

## Testing

Use **Mockito** for mocking classes. Test classes using Easymock should be converted when worked on.

Use **org.hamcrest.MatcherAssert.assertThat** instead of AssertTrue where that makes the code clearer.

## Spring

Use **SpringTemplate.queryForObject()**, not **SpringTemplate.queryForLong()** 
or **SpringTemplate.queryForInt()** because these methods are deprecated.

Do not use the Spring **HibernateTemplate** because this is deprecated; instead use calls to 
Hibernate **Session**.
