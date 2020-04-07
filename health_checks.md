Health check endpoint guidelines
================================

When creating a new application a health check endpoint should be created as standard. A Lambda does not require a Health check at present.

End point Url
-------------
This should be `/health` .

Minimum implementation
----------------------
As a minimum this should return `200` when the application is up and available.

Additional implementation possibilities
---------------------------------------
None of the below possibilities are essential but may help diagnose application issues after you deploy:
* Is there disk space available on the machine your application is running on.
* Is the underlying database your application utilises contactable.
* Is Kafka available to your application.

Specific implementation details
-------------------------------
Java Spring applications can implement [Spring Actuator](https://docs.spring.io/spring-boot/docs/current/reference/html/production-ready-features.html)