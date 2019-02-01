# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vcsrb/version"

Gem::Specification.new do |spec|
  spec.name          = "vcsrb"
  spec.version       = Vcsrb::VERSION
  spec.authors       = ["Ole Kleinschmidt"]
  spec.email         = ["ole.kleinschmidt@ottogroup.com"]

  spec.summary       = %q{vRA API Demo Client}
  spec.description   = %q{vRA API Demo Client for ogcs.io MultiCloud Project}
  spec.homepage      = ""

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end



  #spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #  f.match(%r{^(test|spec|features)/})
  #end
  spec.files         = Dir['bin/*'] + Dir['lib/**/*']
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "thor"
  spec.add_development_dependency "rest-client"
  spec.add_development_dependency "json"
  # spec.add_development_dependency "csv"
  spec.add_development_dependency "filesize"
  spec.add_development_dependency "rainbow"
  # spec.add_development_dependency "terminal-table"
  # spec.add_development_dependency "vmware-vra"
  # spec.add_development_dependency "rbvmomi"
  spec.add_development_dependency "awesome_print"
  # spec.add_development_dependency "net-ssh"
end
