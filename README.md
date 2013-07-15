A git pre-commit hook to run against Chef Cookbooks.

1. Checks for trailing whitespace, mixed tabs and spaces
2. `knife cookbook test` - Ruby and ERB template syntax.
3. `tailor` - Ruby style conventions
4. `foodcritic` - Chef cookbook linting tool

http://dougireton.com/blog/2012/12/10/creating-a-git-pre-commit-hook-for-chef-cookbooks/
