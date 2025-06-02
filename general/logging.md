# Logging standards

**It is advisable to set up a session with the support team to agree what’s**
**required in log events and dashboards before building the applications.**

## Best practises

* The logs need to be structured using the structured logging libraries to be
  able to be processed by the centralised logging system.
* Log messages need to be understandable once combined with other logs (e.g.
  “Document generated successfully” is unhelpful because it’s unclear which
  document has been generated or who it belongs to).
* The ability to trace an event (e.g. customer’s filing) through the
  microservices. Use the log with context `log.InfoContext(...)` or request
  `log.InfoRequest(...)` where possible.
* Try to be consistent in the naming of the log keys. This makes it easier for
  support to find the information and build dashboards.
* Format the log key names in snake case.
* Only use error level for logs which are exceptional circumstances. An error
  log event should result in a bug being raised for investigation.

## Useful information to log

* Company number
* Transaction ID
* User ID (this can be used to look up the user’s email address in the
  database)
* Request ID
* Kafka topic and offset
* Errors/Exceptions
* Status codes

## Things which must not be logged

* Anything which could compromise security (passwords, secrets, keys, etc).
* Sensitive or secure data.
* Watch out for data protection law breaches in the logs. If unsure please seek
  guidance from a lead developer, data protection officer or don’t include it.
* Request body or Kafka data (sensitive data can be added to these in the
  future which would end up unintentionally logged. Log the required fields
  instead).
* Objects/Models (sensitive data can be added to objects in the future which
  would end up unintentionally logged. Log the required fields instead).

## Things to avoid

* Information which isn’t required. “Just in case” information could end up
  making the logs harder to read due the amount of “noise”.
* Messages that would “spam” the logs making it difficult to find errors (e.g.
  success messages in healthchecks).
* Only logging error messages. Diagnosing some issues, e.g. requests going
  missing (routing issues), will be difficult if there isn't any logging of
  where the request has successfully been.
* Logging out all the configs. This could contain passwords and keys (e.g. DB
  connection strings in dev do not have passwords but they do in live).
