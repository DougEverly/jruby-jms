$:.push File.expand_path("../lib", __FILE__)

# Maintain gem's version:
require 'jms/version'
require 'rake'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'jruby-jms'
  spec.version     = JMS::VERSION
  spec.platform    = 'java'
  spec.authors     = ['Reid Morrison']
  spec.email       = ['reidmo@gmail.com']
  spec.homepage    = 'https://github.com/reidmorrison/jruby-jms'
  spec.summary     = 'JRuby interface into JMS'
  spec.description = 'JRuby-JMS is a Java and Ruby library that exposes the Java JMS API in a ruby friendly way. For JRuby only.'
  spec.files       = FileList["./**/*"].exclude('*.gem', './nbproject/*').map{|f| f.sub(/^\.\//, '')}
  spec.test_files  = Dir["test/**/*"]
  spec.license     = "Apache License V2.0"
  spec.has_rdoc    = true
  spec.add_dependency 'gene_pool'
end
