require 'coveralls'
Coveralls.wear!

require 'ruby_randimage'

RSpec.configure do |config|

  config.before(:all) do
    Dir.mkdir('tmp') unless File.directory?('tmp')
  end

  config.after(:all) do
    FileUtils.rm_rf("tmp")
  end
end