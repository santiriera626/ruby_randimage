require 'coveralls'
require 'ruby_randimage'
Coveralls.wear!

RSpec.configure do |config|

  config.before(:all) do
    Dir.mkdir('tmp') unless File.directory?('tmp')
  end

  config.after(:all) do
    FileUtils.rm_rf("tmp")
  end
end