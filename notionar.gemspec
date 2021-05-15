# frozen_string_literal: true

require_relative "lib/notionar/version"

Gem::Specification.new do |spec|
  spec.name          = "notionar"
  spec.version       = Notionar::VERSION
  spec.authors       = ["Katsumata Ryo"]
  spec.email         = ["ktmt.ryo@gmail.com"]

  spec.summary       = "notion api ruby wrapper."
  spec.description   = "notion api ruby wrapper."
  spec.homepage      = "https://github.com/katsumata-ryo/notionar"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/katsumata-ryo/notionar"
  spec.metadata["changelog_uri"] = "https://github.com/katsumata-ryo/notionar"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
