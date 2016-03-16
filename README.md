# RubyRandimage

[![Build Status](https://travis-ci.org/santiriera626/ruby_randimage.svg?branch=master)](https://travis-ci.org/santiriera626/ruby_randimage)
[![Coverage Status](https://coveralls.io/repos/github/santiriera626/ruby_randimage/badge.svg?branch=master)](https://coveralls.io/github/santiriera626/ruby_randimage?branch=master)
[![Code Climate](https://codeclimate.com/github/santiriera626/ruby_randimage/badges/gpa.svg)](https://codeclimate.com/github/santiriera626/ruby_randimage)
[![security](https://hakiri.io/github/santiriera626/ruby_randimage/master.svg)](https://hakiri.io/github/santiriera626/ruby_randimage/master)

ruby_randimage is a gem to generate SVG images with random content ... TODO: 
examples

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_randimage'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_randimage

## Usage

Creating a svg random image and saving to svg_file

    RubyRandimage.create_and_save_file("ruby_randimage.svg")

Creating a svg random image and returning a svg string

    svg = RubyRandimage.create

To render this in html pass the svg string into your view and set a size for the image
    
    <img src="data:image/svg+xml;utf8, <%= raw(svg) %>" width="200px">

## Customising the random image

The random image can be customised by passing additional options

    title: (String) the title of the image.
    colors: (Array) the colors of the image, Example: ["#aaaaaa", "#990000"] or ["#aaa", "#900"].
    symmetry_axes: (Array) the symetry of x and y axes, Example: [true, false] x_axis symmetry .
    num_cells: (Fixnum) the number of cells in the image.
    seed: (Fixnum) the seed to fix random numbers.

Examples

    svg = RubyRandimage.create( title: "ruby rand image", num_cells: 8, colors: ["#fff", "f00"], symmetry_axes: [true, true])

    Color tip: You can define each color density repeating color values. For example to create an image with aproximately 75% white cells and 25% red cells you can do:
    
    svg = RubyRandimage.create( title: "ruby rand image", num_cells: 8, colors: ["#fff", "#fff", "#fff", "f00"], symmetry_axes: [true, true])

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/santiriera626/ruby_randimage. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

