Python Coding Standards
=======================

Overview
--------
This section contains the source documentation for our python guidelines but is ultimately a lot of reading. Please see the Next Section for easy setup instructions that will adhere to the following principles.
Python code within our repositories should adhere to the [Quality Assurance of Code for Analysis and Research](https://best-practice-and-impact.github.io/qa-of-code-guidance/index.html) created by the Office for National Statistics. This naturally builds on top of the [PEP 8](https://www.python.org/dev/peps/pep-0008/) globally accepted python formatting guide as well as emphasising the [Reproducible Analytical Pipelines Minimum Viable Product Guidance](https://github.com/best-practice-and-impact/rap_mvp_maturity_guidance/blob/master/Reproducible-Analytical-Pipelines-MVP.md). You can find a nicer, more readable version of the PEP 8 guidance [here](https://pep8.org/).

Quick setup for working with Python
===================================
**To make this as easy as possible**

Linting installation
--------------------
* You should have as a minimum [pylint]{https://pylint.org/#install} installed in order to quality check code before merging any Pull Requests. You can find install instructions on the linked homepage.
* You should add the following [.pylintrc](.pylintrc) file to any of your python projects' root directories - it is a highly customisable configuration file that enables code scoring.
* With pylint installed, simply use it as shown below and reduce the errors in your files until you exceed a score of 9.5/10.

Usage
-----
Example use case and expected outputs.

`pylint filename.py` ... will get a sample output like this:

````
pylint filename.py
************* Module filename.py
filename.py:3:0: W0301: Unnecessary semicolon (unnecessary-semicolon)
filename.py:1:0: C0114: Missing module docstring (missing-module-docstring)
filename.py:5:0: C0103: Constant name "shift" doesn't conform to UPPER_CASE naming style (invalid-name)
filename.py:9:0: C0103: Constant name "encoded" doesn't conform to UPPER_CASE naming style (invalid-name)
filename.py:13:12: C0103: Constant name "encoded" doesn't conform to UPPER_CASE naming style (invalid-name)

-----------------------------------
Your code has been rated at 7.37/10
````

To understand more about a specific recommendation, as an example for the `C0114` error above:
`pylint --help-msg=missing-module-docstring`
````
:missing-module-docstring (C0114): *Missing module docstring*
  Used when a module has no docstring.Empty modules do not require a docstring.
  This message belongs to the basic checker.
````

**You should aim to exceed a score of 9/10**.

IDE and environment installation
--------------------------------
**It is highly recommended** that you install an [Anaconda Distribution](https://www.anaconda.com/products/individual) and [Visual Studio Code](https://code.visualstudio.com/) and enable the python extension. This is because Anaconda is great at handling packages and **VScode's python extension uses pylint as a default**.

Reference for specific problems
-------------------------------

When trying to fix pylint suggestions see the above section on its usage, and for information on Government Specific stylings please refer to the [Quality Assurance of Code for Analysis and Research](https://best-practice-and-impact.github.io/qa-of-code-guidance/index.html)

In short the follow additional information should be noted:
* Reproducible > Auditable > Assured (information [here](https://best-practice-and-impact.github.io/qa-of-code-guidance/principles.html))
* [KISS](https://best-practice-and-impact.github.io/qa-of-code-guidance/core_programming.html) - Keep it Simple and Straightforward
* [DRY](https://best-practice-and-impact.github.io/qa-of-code-guidance/core_programming.html) - Don't Repeat Yourself
* [SOLID](https://best-practice-and-impact.github.io/qa-of-code-guidance/core_programming.html) - Some more advanced principles around code design (based around Single Responsibility; Open-closed; Liskov substitution; Interface Segregation and Dependency Inversion)