#!/usr/local/bin/ruby

unless FileTest.exist?('.git')
  # 現在位置がtreeのtoplevelか
  p "You need to run this script from toplevel of the working tree."
  exit(1)
end

unless ARGV[0]||ARGV[1]
  p "./submodule-add.rb <dir> <repo>"
  exit(1)
end

if FileTest.exist?(ARGV[0])
  # パスにファイルが存在するか確認
  `rm -rf #{ARGV[0]}`
  `git rm -r #{ARGV[0]}`
  `git submodule add #{ARGV[1]} #{ARGV[0]}`
else
  p "#{ARGV[0]} not found"
end

