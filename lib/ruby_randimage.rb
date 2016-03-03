require "ruby_randimage/version"
require 'rmagick'

module RubyRandimage
  DEFAULT_OPTIONS = {
    colors: ["#000000", "#FF0000"],
    symmetry_axes: ["V", false],
    grid_size: 5,
    background_color: "#FFFFFF",
    key: "\x00\x11\x22\x33\x44\x55\x66\x77\x88\x99\xAA\xBB\xCC\xDD\xEE\xFF"
  }


  def self.dummy_method_to_test_coveralls options={}
    puts DEFAULT_OPTIONS[:colors]
    puts DEFAULT_OPTIONS[:symmetry_axes]
    puts DEFAULT_OPTIONS[:grid_size]
    puts DEFAULT_OPTIONS[:background_color]
    puts DEFAULT_OPTIONS[:key]

    options = DEFAULT_OPTIONS.merge(options)
    
    raise 'key is nil or less than 16 bytes' if options[:key] == nil || options[:key].length < 16
    raise 'grid_size must be between 4 and 9' if options[:grid_size] < 4 || options[:grid_size] > 9

    if options[:colors] == ["#000000", "#FF0000"]
      puts "colors default"
    else
      puts "colors not default"
      puts "this line is not cover"
      puts "this line is not cover too"
    end
    return 1
  end

end
