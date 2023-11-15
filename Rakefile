require "bundler/gem_tasks"
require "mail_autoconfig"
require "minitest/test_task"

desc "Checkout the latest copy of the mozilla ispdb"
task :fetch_ispdb do
  svn_url = MailAutoconfig.ispdb_svn_url
  local_path = MailAutoconfig.local_ispdb_path
  puts "Exporting..."
  `svn export --force #{svn_url} #{local_path}`
  `rm #{local_path}/README`
end

Minitest::TestTask.create # named test, sensible defaults
task default: :test
