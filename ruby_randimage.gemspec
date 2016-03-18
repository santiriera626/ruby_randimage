# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_randimage/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_randimage"
  spec.version       = RubyRandimage::VERSION
  spec.authors       = ["santiriera626" , "camumino", "franx0"]
  spec.email         = ["santiriera626@gmail.com", "camumino@gmail.com", "francisco.moya.martinez@gmail.com"]

  spec.summary       = %q{Pure Ruby library to create SVG random images}
  spec.description   =  <<-EOT
    A powerful, customizable and sophisticated awesome SVG avatars generator from several options such as symmetries, size, color palette and color densities.
  EOT
  spec.homepage      = "http://ruby_randimage.monkeykoders.net"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', "~> 3.4.0"
  
end
