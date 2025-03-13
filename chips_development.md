# CHIPS development guidelines

## General
Avoid using deprecated methods, both in the CHIPS code and third-party packages to avoid work in the future.
 
## Packages
Don't add classes to the **uk.gov.ch.cap** package. The package was created for a specific legal change and is no longer needed.

## Rule configuration
The rules in the CSV configuration should be ordered by rule bean name to make finding the entry as easy as possible.

## Testing
Use **Mockito** for mocking classes. Test classes using Easymock should be converted when worked on.
Use **org.junit.Assert.assertThat** instead of AssertTrue where that makes the code clearer.
Use the **uk.gov.ch.chips.common.util.DateUtils** class to generate Dates for testing. 

## Spring
Use **SpringTemplate.queryForObject()**, not **SpringTemplate.queryForLong()** or **SpringTemplate.queryForInt()** because these methods are deprecated.

Do not use the Spring **HibernateTemplate** because this deprecated; instead use calls to **HibernateSession**.