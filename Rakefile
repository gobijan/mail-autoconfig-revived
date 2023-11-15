require "bundler/gem_tasks"
require "mail_autoconfig"
require "minitest/test_task"
require "fileutils"

# desc "Checkout the latest copy of the mozilla ispdb"
# task :fetch_ispdb do
#   svn_url = MailAutoconfig.ispdb_url
#   local_path = MailAutoconfig.local_ispdb_path
#   puts "Exporting..."
#   `svn export --force #{svn_url} #{local_path}`
#   `rm #{local_path}/README`
# end

desc "Checkout the latest copy of the mozilla ispdb from GitHub"
task :fetch_ispdb do
  repo_url = MailAutoconfig.ispdb_github_url
  local_path = MailAutoconfig.local_ispdb_path
  temp_clone_path = File.join(local_path, "temp_autoconfig_clone")
  ispdb_dir = "ispdb"

  puts "Cloning repository to temporary location..."
  FileUtils.rm_rf(temp_clone_path) if Dir.exist?(temp_clone_path)
  system("git clone --depth 1 #{repo_url} #{temp_clone_path}")

  # Copying the ispdb directory contents to the local path
  FileUtils.mkdir_p(local_path) unless Dir.exist?(local_path)
  source_path = File.join(temp_clone_path, ispdb_dir)
  FileUtils.cp_r(Dir.glob("#{source_path}/*"), local_path)

  # Cleanup: Removing the temporary clone
  FileUtils.rm_rf(temp_clone_path)

  puts "The latest copy of ispdb has been fetched to #{local_path}"
end

Minitest::TestTask.create # named test, sensible defaults
task default: :test
