JavaScript Coding Standards
===========================

Use the Chips Java Coding Standard where ever it makes sense. In particular with regard to:
Formatting and indentation Naming convention (methods and variables start with lower case, classes start with upper case, constants in all upper case, etc.).

Documentation - although we do not have any javadoc formatter for JavaScript it makes sense to document JavaScript code using the same conventions.

Mandatory curly braces for if, for and while.

Semicolons - Terminate every statement with a semicolon even though they are not required.

Additional Rules
---

**File names**

Since JavaScript files typically contain multiple classes, naming the file after a class as in Java doesn't neccessarily make sense. To make this explicit, names of JavaScript files should start with a lower case letter and indicate the functionality it provides. For example:

**table.js** - contains the classes Table and Row
**query-handling.js** - contain functionality specific to the chips query handling module.

Simulate instance methods by assinging the them to the object's prototype. For example.
``
Table.prototype.movetoRow = function(offset) { ... };
``

Simulate “static” (class) variables and methods by assigning them to the constructor method. For example:

``
Table.findRelativeRow = function(row) { ... };
Calendar.MONTH_MODE = 1;   
Calendar.YEAR_MODE = 2;
``

To use these “static” methods the containing object must always be specified, even within methods belonging to the containing objects. For example:

``
if(Calendar.MONTH_DATE == 1) ...
``

Minimize the number of global methods and objects - Any top level variable or method declared in any javascript file imported by the HTML page is visible to all other javascript code, inviting a name clash. The number of global variables and methods should be kept to a minimum.
Instead create a “class” for it. For example:

``
function StringUtil() { ... };
StringUtil.CHIPS_DATA_FORMAT = "dd/mm/yy";
StringUtil.formatDate = new function(date) { ... };
``

Alternatively create an object literal containing the neccessary members. For example:

``
StringUtil = {
    CHIPS_DATE_FORMAT: "dd/mm/yy",
    formatDate: function(date) { ... };
}
``

or

``
QueryHandling = {
    REJECTED_IMAGE : "images/qha/rejected.png",
    ACCEPTED_IMAGE : "images/qha/rejected.png",
    ERROR_FLAG_IMAGE: "image/qha/error_flag.png",
    parseFieldId: function(id) { ... }
}
``

In the same vein avoid creating global variables inside methods. A variable that not declared using the “var” keyword will become global. It can then overwrite a same named variable instantiated in another method or in the global scope. The same goes for variables in for loops:

``
for(var i = 0; i < len; i++) {
   ...
}
``

**Link to previous event handlers**
 
When assigning a method to handle and event such as body.onload, if it cannot be taken for granted that some other piece of code also isn't responding to or won't be responding to this event, then take the precaution to link to any previous handler. For example:
``
myPage = {
 
    oldHandlBodyLoad: page.handleBodyLoad
     
    handleBodyLoad = function(event) {
        if(oldHandleBodyLoad) {
            oldHandleBodyLoad(event);
        }
        // page specific stuff
    }
}
   
page.handleBodyLoad = myPage.handleBodyLoad;
``
