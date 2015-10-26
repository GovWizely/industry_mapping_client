# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'industry_mapping_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'industry_mapping_client'
  spec.version       = IndustryMappingClient::VERSION
  spec.authors       = ['Calum Halcrow']
  spec.email         = ['calumhalcrow@gmail.com']
  spec.summary       = 'industry_mapping API client.'
  spec.description   = 'API client for the GovWizely/ITA industry_mapping service.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'webmock'
end
