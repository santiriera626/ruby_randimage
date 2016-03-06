require "ruby_randimage/version"

module RubyRandimage
  DEFAULT_OPTIONS = {
    title: "User",
    colors: ["#990000"],
    symmetry_axes: [true, false],
    grid_size: 5,
    background_color: "#aaaaaa"
  }

  #TODO:[sriera] Optimizar
  def self.create options={}

    25.times do |i|
      options = DEFAULT_OPTIONS.merge(options)
      
      width = options[:grid_size]
      
      #raise 'grid_size must be between 4 and 9' if options[:grid_size] < 4 || options[:grid_size] > 9

      svg = "<svg xmlns='http://www.w3.org/2000/svg' width='#{width}' height='#{width}'>"      
      svg += "<title>#{options[:title]}</title>" 
      svg += "<rect width='100%' height='100%' x='0' y='0' fill='#{options[:background_color]}' stroke='none'/>"                               
      
      if options[:symmetry_axes][0]
        num_cols = (width/2.to_f).ceil
      else
        num_cols = width
      end

      if options[:symmetry_axes][1]
        num_rows = (width/2.to_f).ceil
      else
        num_rows = width
      end

      (num_rows*num_cols).to_i.times do |j|
        
        cell = rand(num_rows*num_cols)
        color = options[:colors][rand(options[:colors].length)]

        cell_x = (cell%num_cols)
        cell_y = (cell/num_cols)

        svg += "<rect fill='#{color}' id='cell_#{cell}' stroke='none' fill-rule='nonzero' x='#{cell_x}' y='#{cell_y}' width='1' height='1' />"
        
        if options[:symmetry_axes][0] && width - cell_x -1 != cell_x
          svg += "<rect fill='#{color}' id='cell_#{cell}' stroke='none' fill-rule='nonzero' x='#{width - cell_x-1}' y='#{cell_y}' width='1' height='1' />"
          if options[:symmetry_axes][1] && width - cell_y -1 != cell_y
            svg += "<rect fill='#{color}' id='cell_#{cell}' stroke='none' fill-rule='nonzero' x='#{width - cell_x-1}' y='#{width - cell_y-1}' width='1' height='1' />"
          end
        end

        if options[:symmetry_axes][1] && width - cell_y -1 != cell_y
          svg += "<rect fill='#{color}' id='cell_#{cell}' stroke='none' fill-rule='nonzero' x='#{cell_x}' y='#{width - cell_y-1}' width='1' height='1' />"
        end

      end
      svg += "</svg>"
      File.open("temp_image_#{i}.svg", 'wb') { |f| f.write(svg) }
    end
  end

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
