#!/usr/bin/env ruby

# check for whitespace errors
git_ws_check = `git diff-index --check --cached HEAD --`
unless $?.success?
  puts git_ws_check
  exit 1
end

COOKBOOK_PATH = File.split `git rev-parse --show-toplevel`
PARENT_PATH = COOKBOOK_PATH[0]
COOKBOOK_NAME = COOKBOOK_PATH[1].chomp # remove trailing newline

puts 'Running knife cookbook test...'
knife_output = `knife cookbook test #{ COOKBOOK_NAME } -o #{ PARENT_PATH } -c ~/chef/wit/chef-repo/.chef/knife.rb`
unless $?.success?
  puts knife_output
  exit 1
end

puts 'Running tailor...'

# Get the file names of (A)dded, (C)opied, (M)odified Ruby files 
STAGED_FILES = `git diff-index --name-only --diff-filter=ACM HEAD -- '*.rb'`
STAGED_FILES.lines do |file|
  file.chomp! # remove carriage returns
  puts file
    tailor_output = `tailor --max-line-length 999 #{ file }`
    unless $?.success?
      puts tailor_output
      exit 1
    end
end

puts "Running foodcritic..."
fc_output = `foodcritic --epic-fail any #{ File.join(PARENT_PATH, COOKBOOK_NAME) }`
unless $?.success?
  puts fc_output
  exit 1
end
