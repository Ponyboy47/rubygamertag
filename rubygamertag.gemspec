# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rubygamertag/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "rubygamertag"
  s.version     = RubyGamertag::VERSION
  s.authors     = ["Ponyboy47"]
  s.email       = ["ponyboy47@gmail.com"]
  s.homepage    = "https://github.com/Ponyboy47/rubygamertag"
  s.summary     = %q{A gem for retrieving XBOX Live gamertag info}
  s.description = %q{Get Info on XBL Gamertag profile, games, and achievments}

  s.rubyforge_project = "rubygamertag"

  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'json'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'fakeweb'
end

