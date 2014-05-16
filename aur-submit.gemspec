Gem::Specification.new do |gem|
  gem.name        = "aur-submit"
  gem.version     = "0.1.0"
  gem.authors     = ["Pat Brisbin"]
  gem.email       = ["pbrisbin@gmail.com"]
  gem.homepage    = "http://github.com/pbrisbin/aur-submit"
  gem.license     = "MIT"
  gem.summary     = %q{Command-line AUR package submission}
  gem.description = %q{Tiny Ruby script to programatically submit packages to the Arch User Repository}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "nokogiri"
end
