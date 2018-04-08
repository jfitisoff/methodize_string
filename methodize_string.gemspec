require './lib/methodize_string/version'

Gem::Specification.new do |s|
  s.name        = 'methodize_string'
  s.version     = MethodizeString::VERSION
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.summary     = %q{A small library that transforms UI strings into strings that can be used as method names.}
  s.description = "A small library that transforms UI strings into strings that can be used as method names."
  s.authors     = ["John Fitisoff"]
  s.email       = 'jfitisoff@yahoo.com'

  s.add_runtime_dependency "activesupport"

  s.add_development_dependency "coveralls"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "pry"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"

  s.files = [
    "lib/methodize_string.rb",
    "lib/methodize_string/methodize_string.rb",
    "lib/methodize_string/number_map.rb",
    "lib/methodize_string/string.rb",
    "lib/methodize_string/version.rb"
  ]
  s.homepage    = 'http://rubygems.org/gems/insite'
  s.license     = 'MIT'
end
