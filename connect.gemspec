# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = '1c-connect-api-ruby'
  s.version     = '0.0.1'
  s.summary     = '1C-Connect API client'
  s.authors     = ['Anatoly Busygin']
  s.email       = 'anatolyb94@gmail.com'
  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.license = 'MIT'
end
