
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "totalvoice_ruby/version"

Gem::Specification.new do |spec|
  spec.name          = "totalvoice_ruby"
  spec.version       = TotalvoiceRuby::VERSION
  spec.authors       = ["Jhonatan Martins"]
  spec.email         = ["jhonatanbmartins@gmail.com"]
  spec.summary       = "Simple wrapper for the Totalvoice API"
  spec.homepage      = "https://github.com/JhoMartins/totalvoice_ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.1"
  spec.add_dependency "rest-client", "~> 2.1"
end
