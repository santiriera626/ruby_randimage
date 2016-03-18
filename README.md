# RubyRandimage

[![Build Status](https://travis-ci.org/santiriera626/ruby_randimage.svg?branch=master)](https://travis-ci.org/santiriera626/ruby_randimage)
[![Coverage Status](https://coveralls.io/repos/github/santiriera626/ruby_randimage/badge.svg?branch=master)](https://coveralls.io/github/santiriera626/ruby_randimage?branch=master)
[![Code Climate](https://codeclimate.com/github/santiriera626/ruby_randimage/badges/gpa.svg)](https://codeclimate.com/github/santiriera626/ruby_randimage)
[![security](https://hakiri.io/github/santiriera626/ruby_randimage/master.svg)](https://hakiri.io/github/santiriera626/ruby_randimage/master)


Are you looking for an amazing avatar generator for your website`s users? ruby_randimage is your gem! 

A powerful, customizable and sophisticated awesome SVG avatars generator from several options such as symmetries, size, color palette and color densities.

RubyRandimage is a pure Ruby library without any dependencies.


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

Create a random svg image saved on the file system.

    RubyRandimage.create_and_save_file("ruby_randimage.svg")

Create a random svg image String 

    svg = RubyRandimage.create

Returned String can be used in a simple way in your HTML document settting a size for your image
    
    <img src="data:image/svg+xml;utf8, <%= raw(svg) %>" width="200px">

## Customizing your random svg image

Random svg image can be customized setting the following options:

    title: (String) SVG <title> tag for image. Example: "awesome_avatar"
    colors: (Array) colors to compose your image, Example: ["#aaaaaa", "#990000"] or ["#aaa", "#900"].
    symmetry_axes: (Array).
        - No symmetry: [false, false]
        - X symmetry: [true, false]
        - Y symmetry: [false, true]
        - Full symmetry: [true, true]
    num_cells: (Fixnum) Number of rows and columns in the image. Min: 2, Max:16
    seed: (Fixnum) seed to set random numbers.

Examples

    svg = RubyRandimage.create( title: "ruby rand image", num_cells: 8, colors: ["#fff", "f00"], symmetry_axes: [true, true])

    Colors tip: You can define each color density setting the same color multiple times. For example to create an image with aproximately 75% white cells and 25% red cells you can do:
    
    svg = RubyRandimage.create( title: "ruby rand image", num_cells: 8, colors: ["#fff", "#fff", "#fff", "f00"], symmetry_axes: [true, true])

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/santiriera626/ruby_randimage. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

