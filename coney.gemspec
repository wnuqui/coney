# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'coney/version'

Gem::Specification.new do |spec|
  spec.name          = 'coney'
  spec.version       = Coney::VERSION
  spec.authors       = ['Wilfrido T. Nuqui Jr.']
  spec.email         = ['nuqui.dev@gmail.com']

  spec.summary       = 'Convert currency via Google.'
  spec.description   = 'Convert currency via Google.'
  spec.homepage      = 'https://github.com/wnuqui/coney'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
