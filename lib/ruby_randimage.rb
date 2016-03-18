require "ruby_randimage/version"


# RubyRandimage creates a random image with the input values.
# The image created has a width = num_cells and all the internal squares have a width of 1px
# The first cell color its used as backgroud color 
# You can set the random seed to create images like an identicon image 

module RubyRandimage

  DEFAULT_OPTIONS = {
    :title => "image title", # the title of the image
    :colors => ["#aaaaaa", "#990000"], # the colors of the image
    :symmetry_axes => [true, true], # the symetry of x and y axes 
    :num_cells => 8, # the number of cells in the image
    :seed => nil # the seed to fix random numbers
  }

  # create a random image svg and save it to the given filename
  #
  # Example:
  #   >> RubyRandimage.create_and_save_file('test_identicon.png', options)
  #   => result (Fixnum)
  #
  # @param filename [string] the full path and filename to save the image svg to
  # @param options [hash] additional options for the image
  #
  def self.create_and_save_file filename, options={}

    # create the svg image string
    svg = create(options)

    # save svg to file filename
    File.open(filename, 'wb') { |f| f.write(svg) }

  end

  # create a random image svg and return it as a svg string
  #
  # Example:
  #   >> RubyRandimage.create(options)
  #   => (String)
  #
  # @param options [hash] additional options for the image
  #
  def self.create options={}

    options = DEFAULT_OPTIONS.merge(options)
    
    raise "title is invalid" if options[:title] == nil || options[:title] == ''
    raise "num_cells must be between 2 and 16" if options[:num_cells] < 2 || options[:num_cells] > 16
    raise "symmetry_axes must be a two elemnts array" if options[:symmetry_axes].class != Array || options[:symmetry_axes].count!=2
    raise "colors must be an array with at least two elemments" if options[:colors].class != Array || options[:colors].count < 2
    raise "seed is invalid, must be nil or fixnum" if !options[:seed].nil? && options[:seed].class != Fixnum 

    # generate the cells matrix with colors 
    matrix = generate_matrix options[:num_cells], options[:colors], options[:symmetry_axes], options[:seed]

    # generate and return the svg string with matrix values
    return generate_svg options[:title], matrix
  end

  private

    # create a num_cells*num_cells matrix of colors randomly
    #
    # Example:
    #   >> generate_matrix(8, ["#ffffff", "#ffffff", #ff0000], [true, false])
    #   => (Array[Array[(String)]])
    #
    # @param num_cells (Fixnum) number of image cells 
    # @param colors (Array) the image colors
    # @param symmetry_axes (Array) the image symmetry_axes [x_axis, y_axis]
    # @param seed (Fixnum) The seed to init the rand object

    def self.generate_matrix num_cells, colors, symmetry_axes, seed = nil

      # init rand object if seed!=nil
      srand(seed) if ! seed.nil?
      
      # init matrix 
      cells = Array.new
      num_cells.times { |i| cells[i] = []}

      # set num_cols and num_rows for the symmetry_axes setted
      num_cols = symmetry_axes[0] ? (num_cells/2.to_f).ceil : num_cells
      num_rows = symmetry_axes[1] ? (num_cells/2.to_f).ceil : num_cells

      # for each cell
      (num_rows*num_cols).to_i.times do |cell|
        
        # cell position at matrix  
        cell_x = (cell%num_cols)
        cell_y = (cell/num_cols)

        # random color from colors list
        color = colors[rand(colors.length)]
        
        # fill cell
        cells[cell_x][cell_y] = color

        # mirror cell x_axis
        if symmetry_axes[0] && num_cells - 1 != 2*cell_x
          cells[num_cells - cell_x - 1][cell_y] = color

          # mirror cell x_axis and y_axis
          if symmetry_axes[1] && num_cells -1 != 2*cell_y
            cells[num_cells - cell_x - 1][num_cells - cell_y - 1] = color
          end
        end

        #mirror cell y_axis
        if symmetry_axes[1] && num_cells -1 != 2*cell_y
          cells[cell_x][ num_cells - cell_y-1 ] = color
        end
      end

      # return the matrix of colors
      return cells
    end

    # generate the svg string 
    #
    # Example:
    #   >> generate_svg("svg_title" , matrix)
    #   => (String)
    #
    # @param title (String) the title of the svg image
    # @param matrix (Array[Array[(String)]]) the colors matrix

    def self.generate_svg title, matrix

      # open svg tag
      size = matrix.length
      svg = "<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='#{size}' height='#{size}'>"

      # set title
      svg << "<title>#{title}</title>" 

      # background with first color
      svg << "<rect width='100%' height='100%' x='0' y='0' fill='#{matrix[0][0]}' stroke='none' shape-rendering='crispEdges'/>"

      size.times do |col|
        size.times do |row|
          # draw rect if its color its different than background color
          svg << "<rect fill='#{matrix[col][row]}' stroke='none' fill-rule='nonzero' x='#{col}' y='#{row}' width='1' height='1' shape-rendering='crispEdges' />" if matrix[col][row] != matrix[0][0]
        end
      end 

      # close svg tag
      svg << "</svg>"

    end
end
