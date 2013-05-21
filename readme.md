JSON Validator
==============

A validation tool to confirm the formatting of agency.gov/data catalog files.  This validates the format against the schema defined in
[Project Open Data](http://project-open-data.github.io/schema/)

What Problem This Solves
------------------------

After generating a federal government data catalog file, it can be difficult to know whether that file conforms with the specification.


How This Solves It
------------------

This parses a JSON file and indicates whether it's conformant.


Building and running locally
------------------

This is an HTML/Coffeescript application.  It uses linked repos, so in order to run this locally, you should do the following after cloning:

     cd json-validator
     git submodule init
     git submodule update

Then you should be able to simply browse the 'json-validator/index.html' file

If you want to make changes, you should change the '.coffee' files, and compile them with the coffeescript compiler:

     coffee -c js/*.coffee

You can find information about coffee script [here](http://coffeescript.org/)
