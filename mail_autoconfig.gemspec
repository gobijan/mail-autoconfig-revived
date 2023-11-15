lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mail_autoconfig/version"

Gem::Specification.new do |spec|
  spec.name = "mail_autoconfig"
  spec.version = MailAutoconfig::VERSION
  spec.authors = ["Bijan Rahnema, Dan Wentworth"]
  spec.email = ["bijan@screenisland.com"]
  spec.summary = "Determine configuration details for a mailbox using Mozilla's ISPDB"
  spec.homepage = ""
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.15"
  spec.add_dependency "faraday"
  spec.add_development_dependency "bundler", "~> 2.4"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "redcarpet"
  spec.add_development_dependency "standard"
end
