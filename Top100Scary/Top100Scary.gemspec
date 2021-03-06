# frozen_string_literal: true

require_relative "lib/Top100Scary/version"

Gem::Specification.new do |spec|
  spec.name          = "Top100Scary"
  spec.version       = Top100Scary::VERSION
  spec.authors       = ["Andrew"]
  spec.email         = ["Designinglife11@gmail.com"]

  spec.summary       = "Review IMDB's top 100 scary movies!"
  spec.homepage      = "https://github.com/Designinglife11/Top100ScaryMovies/tree/main/Top100Scary"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/Designinglife11/Top100ScaryMovies/tree/main/Top100Scary"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Designinglife11/Top100ScaryMovies/tree/main/Top100Scary"
  spec.metadata["changelog_uri"] = "https://github.com/Designinglife11/Top100ScaryMovies/tree/main/Top100Scary"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "actionview"
end
