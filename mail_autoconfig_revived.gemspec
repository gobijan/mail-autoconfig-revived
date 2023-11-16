lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mail_autoconfig/version"

Gem::Specification.new do |spec|
  spec.name = "mail_autoconfig_revived"
  spec.version = MailAutoconfig::VERSION
  spec.authors = ["Bijan Rahnema, Dan Wentworth"]
  spec.email = ["bijan@screenisland.com"]
  spec.summary = "Determine configuration details for a mailbox using Mozilla's ISPDB"
  spec.homepage = "https://github.com/gobijan/mail-autoconfig-revived"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.15"
  spec.add_dependency "faraday", "~> 2.7"
  spec.add_development_dependency "bundler", "~> 2.4"
  spec.add_development_dependency "rake", "~> 13.1"
  spec.add_development_dependency "yard", "~> 0.9"
  spec.add_development_dependency "redcarpet", "~> 3.6"
  spec.add_development_dependency "standard", "~> 1.32"
end
