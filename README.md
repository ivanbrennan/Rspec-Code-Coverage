##RSpec Code Coverage Lab

How do we know we have enough tests, and that our tests cover all of our code?

Enter [simplecov](https://github.com/colszowka/simplecov)! simplecov is a tool that will measure your test run against the code paths in your code files and see if you're exercising them all. "Code Paths" includes method calls, conditional statements, loops, and anything that branches program flow.

This is important because you want to be able to know that every decision your program makes is being tested, no matter what.

**Assignment**

Given the above Jukebox and Song classes, write the tests required in jukebox_spec.rb to get yourself to 100% code coverage on simplecov.

**Instructions**

1. Install the simplecov gem.
2. Run your spec file with rspec

You should see output at the end of the test results that looks something like:
`Coverage report generated for RSpec to /Users/scottreynolds/code/ta/labs/simplecov/coverage. 14 / 33 LOC (42.42%) covered.`

3. Open coverage/index.html in your browser window to view the report.
4. When you hit 100% test coverage, submit either a gist or a repository of your solution and the coverage report