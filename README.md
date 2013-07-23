A git pre-commit hook for Chef Cookbooks
========================================

This script checks the following, before committing code to a chef server that might cause it to break, die, or otherwise be sad:

1. Checks for trailing whitespace, mixed tabs and spaces
2. Runs `knife cookbook test` - Ruby and ERB template syntax.
3. Runs `tailor` - Ruby style conventions
4. Runs `foodcritic` - Chef cookbook linting tool

A fork of [Doug Ireton](http://dougireton.com/blog/2012/12/10/creating-a-git-pre-commit-hook-for-chef-cookbooks/)

To Install
----------

You must put a file called `pre-commit` in `$REPO/.git/hooks/` of the
repository you want this script to run on.

    # Install Prerequsities
    $ gem install tailor
    $ gem install foodcritic

    # Checkout code
    $ cd ~/repos
    $ git clone git@github.com:mburns/chef-pre-commit-hook.git

    # Symlink (or copy) the pre-commit file to .git/hooks/pre-commit in your chef repository
    $ ln -s ~/repos/chef-pre-commit-hook/pre-commit ~/repos/chef-repo/.git/hooks/pre-commit

