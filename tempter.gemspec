require_relative 'lib/untitled_goose_game/version'

Gem::Specification.new do |spec|
  spec.name = 'untitled_goose_game'
  spec.version = UntitledGooseGameBuildConfig::VERSION
  spec.authors = ['Валентин']
  spec.email = ['fun.haliksar.devel@gmail.com']

  spec.summary = 'Write a short summary, because RubyGems requires one.'
  spec.description = 'Write a longer description or delete this line.'
  spec.homepage = 'https://github.com/HaliksaR/untitled_goose_game'
  spec.license = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '~> 2.7'
end
