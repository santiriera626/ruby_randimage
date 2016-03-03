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


  def self.dummy_method_to_test_coveralls
    puts DEFAULT_OPTIONS[:color]
    puts DEFAULT_OPTIONS[:symmetry_axes]
    puts DEFAULT_OPTIONS[:grid_size]
    puts DEFAULT_OPTIONS[:background_color]
    puts DEFAULT_OPTIONS[:key]
  end

end
