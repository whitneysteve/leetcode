# LeetCode

Implementation of some test problems from LeetCode. I normally just go [here](https://leetcode.com/problemset/all/) and click 'Pick One' until I get a free one :)

## Setup

If you are using RVM, it should select the correct ruby version and create a gemset for you. If not, it might be a good idea to create a new gemset for yourself, as per your environment.

Run `bundle install` to install the test and linting frameworks. If the `bundle` command is not found you may also need to install bundler (`gem install bundler`) if it's not set up globally on your system.

## Working

Working on this usually follows the following pattern.

Create a branch
---------------

`./branch <branch_name>`

Usually I make some changes.

Run Tests
-----------

`./test`

While I make changes and to make sure I don't break anything else.

Run Locally
-----------

`./run`

This will run any individual challenges that need to be run from the command line, rather than tests.

Run Linter
----------

`./lint`

To keep code in tip-top shape (usually followed by disabling loads of Rubocop rules).

Commit, or Ship
---------------

If you want to commit and keep working run:

`./commit`

If you want to commit and are done, ship it!

`./ship`

This merges the branch to main.

Credits
-------

[Leet Code](https://leetcode.com) is a fun coding challenge I use to practice coding challenges.
