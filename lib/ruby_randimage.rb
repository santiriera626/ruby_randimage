require "ruby_randimage/version"

module RubyRandimage
  DEFAULT_OPTIONS = {
    title: "User",
    colors: ["#990000"],
    symmetry_axes: [true, false],
    grid_size: 5,
    background_color: "#aaaaaa"
  }


  def self.create_and_save_file filename, options={}

    # create the svg
    svg = create(options)

    # save to file filename
    File.open(filename, 'wb') { |f| f.write(svg) }

  end


  def self.create options={}

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
    return svg

  end

  private 

    def generate_matrix 

    end


end
