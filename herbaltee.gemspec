lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'herbaltee'
  s.version     = '0.0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Matt Whiteley']
  s.email       = ['mwhiteley@engineyard.com']
  s.homepage    = 'http://github.com/engineyard/herbaltee/'
  s.summary     = 'Basic ERB templater'
  s.description = 'Render and write templates using ERB'

  s.required_ruby_version = '>= 1.9'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'

  s.require_path = 'lib'
  s.files        = Dir.glob('{lib}/**/*') + %w(LICENSE README.md)
  s.test_files   = Dir.glob('{spec}/**/*') + %w(Rakefile Gemfile Gemfile.lock)
end
