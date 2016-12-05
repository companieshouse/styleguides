Pull Request Standards
======================

Title
-----

* Should be a short description of the what the purpose of the pull request is
* Keep it to around 50 characters
* Capitalise the first character
* If we look at the titles of all the pull requests between to points in time e.g. 2 releases, it should give us a clear idea of what has changed

Body
----

* Here you need to provide the detail of what it is you're trying to do, if the pull request is small then the title maybe enough
* Wrap each line at around 72 characters (github won't do this for you)
* Add any relevant links i.e. other related pull requests, do not rely on the fact that there are links to the stories, there should be enough detail in the description to gives us the context
* Add any related JIRA stories at the bottom under a "Resolves" section
* `@mention` anyone you to specifically look at it
* Don't assume reviewer familiarity with your pull request
* Consider the audience of your pull request, it sometimes might not be a technical person looking at it
* Always remember that our repos should be treated as open source i.e. anyone can look at them, so be mindful of what you write in commits/pull requests

Example
-------
```
Add PSC Summary page with Director Details
This is a new page for a PSC Summary, it uses Director details for the PSC

* All details gathered previously in the journey for director prepopulate
the PSC fields.
* Two nature of controls get automatically set to the PSC
* The only field validation is a checkbox at the bottom, noting agreement.

Related concordion PR:
companieshouse/concordion-webincs#13

Resolves:
SCRS-402, SCRS-405, SCRS-407
```

Checklist
---------

1. The correct branch to merge changes into has been specified
    * Look out for a large number of files being listed as having changed. It could be that you are comparing to the incorrect base branch.
2. There are no merge conflicts
    * Make sure that the pull request branch has pulled in the latest develop.
3. Any feature notes have been created/updated as appropriate
    * These should contained any pertinent information about this change i.e. external dependencies, link to db patch etc.
4. All acceptance tests submitted for review pass
    * All tests should pass before a pull request is created.
5. Is it as small as it could be? Minimise the number of changes in a single pull request
    * If github says the diff is too big then it probably is, think about breaking the feature/code up into a number of smaller pull requests. If the pull request is too big, it will be rejected and will need to be resubmitted as several smaller requests
6. Add links to any external pull requests that relate to this one
    * Make the life of your reviewer easier by adding links to any related pull requests, then they won't get missed.
7. Is pull request labelled correctly
8. Clearly note whats supposed to be in the pull request
    * When creating the pull request, always add a list of what change/feature is in there.
9. Link to the definition of done for this feature in the description if appropriate
10. Ensure your code adhere to all other relevant standards in this repo
