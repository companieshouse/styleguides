JSP Standards
==================

Currently there are no general JSP standards, but there are some features of
the use of the CFF tags in CHIPS that require guidance.

Use of CFF tags
---------------

CHIPS uses a variety if bespoke CFF tags embedded in the JSPs to provide Java
Faces facilities. This section provides some guidance on their use.

**ch:ajaxAction**
When using this tag the attribute **waitForResponse** must be set to **true**
if the response adds or alters HTML tags that have data elements with in them.
Otherwise the screen layout and the data can become corrupted.
