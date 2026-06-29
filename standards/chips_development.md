# CHIPS Development Guidelines

## General

- To reduce future maintenance work, avoid using deprecated methods - both in
CHIPS code and third-party packages.
- Use the `uk.gov.ch.chips.common.util.DateUtils` class for generating dates.
- Avoid `new Date()`; prefer `DateUtils.today()`.
- Use methods in `DateUtils` where applicable.
- Use the Apache `StringUtils` class for String comparisons e.g. `StringUtils.isBlank(x)`.

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

- Use `uk.gov.ch.chips.common.util.DateUtils` to generate dates in tests, in tandem with using `DateUtils` in the code. This prevents spurious errors in code caused by times ticking over. 

```
    @BeforeClass
    public static void setupAll() {
        DateUtils.setDateFactory(new MockDateFactory(2026, 6, 29));
    }

    @AfterClass
    public static void tearDownAll() {
        DateUtils.initializeDateFactory();
    }
    
    @Test
    public void testRule() {
        Date myDate = DateUtils.today()
    }
```

### Testing Chips Rules

- When testing CHIPS Rules, use `AbstractChipsRuleTest` and the provided assertion methods where appropriate.

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

## Hibernate

As of June 2026, Chips is using Hibernate 5.3. Hibernate 5 introduces support for JPA and native Hibernate operations are being deprecated 
e.g. the Hibernate Criteria is deprecated in 5.3 and is removed in Hibernate 6. 

We are currently using a 'getEntityManager' method that casts the existing Hibernate Session to an EntityManager. This is a temporary solution until we can fully migrate to JPA.
```
    private EntityManager getEntityManager() {
        return sessionFactory.getCurrentSession();
    }
```

- Prefer `getEntityManager` over `getCurrentSession` when possible.
- Use JPA Query API instead of the JPA Criteria API unless predicates need to be added dynamically, as the query is simpler to use.
- Use JPA methods e.g. `persist` and `merge` over the Hibernate methods e.g. `save` and `update`.

- Use JPA Annotations for new entities instead of hbm.xml files. See `User` and `OrgUnit` for examples.

- **Do not** use the Hibernate Criteria API.
- **Do not** use @PersistenceContext to inject the EntityManager as this is not currently compatible with getCurrentSession in the same transaction.

## Spring

As of June 2026, Chips is using Spring 4.x. The server project (i.e. home to most Service and DAO classes) is configured to support annotations e.g. `@Component`.

- Prefer Spring Annotations over XML configuration for code in the server project e.g. `@Component`, `@Autowired`, `@Value`, `@Qualifier`, `@Service`, `@Repository`, `@Controller`, etc.
- Favour Construction Injection over Field Injection for Spring Beans and mark injected fields as final. This makes it easier to detect beans that have non-threadSafe variables.
- Use `@Transactional` annotation instead of adding classes to the list in `spring-dao.xml` or `spring-transactions.xml`.
- When converting old code to use annotations, remove all old config from xml files, including any transactional config from `spring-dao.xml` or `spring-transactions.xml`.
 
- **Do not** using Spring's `HibernateTemplate` (deprecated). Use Hibernate/JPA `EntityManager` methods instead.
- **Do not** extend base classes like `ChipsHibernateDaoSupport` or `AbstractChipsDao`. Use the `EntityManager` directly instead. This creates cleaner code which will be easier to migrate in the future.