
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "parseGVP/version"

Gem::Specification.new do |spec|
  spec.name          = "parseGVP"
  spec.version       = ParseGVP::VERSION
  spec.authors       = ["Hidenori Miyoshi"]
  spec.email         = ["miyohide@gmail.com"]

  spec.summary       = %q{Parse a json that Gradle Version Plugin creates}
  spec.description   = %q{Parse a json that Gradle Version Plugin creates}
  spec.homepage      = "https://github.com/miyohide/parseGVP"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0.16.1"
end
