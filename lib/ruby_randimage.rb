require "ruby_randimage/version"
#require "byebug"

module RubyRandimage

  # TODO: [sriera] doc
  DEFAULT_OPTIONS = {
    title: "image title",
    colors: ["#aaaaaa", "#990000"],
    symmetry_axes: [true, true],
    num_cells: 5
  }

  # TODO: [sriera] doc
  def self.create_and_save_file filename, options={}

    # create the svg
    svg = create(options)

    # save svg to file filename
    File.open(filename, 'wb') { |f| f.write(svg) }

  end

  # TODO: [sriera] doc
  def self.create options={}

    options = DEFAULT_OPTIONS.merge(options)
    
    raise "title is invalid" if options[:title] == nil || options[:title] == ''
    raise "num_cells must be between 4 and 9" if options[:num_cells] < 4 || options[:num_cells] > 9

    matrix = generate_matrix options[:num_cells], options[:colors], options[:symmetry_axes]

    return generate_svg options[:title], matrix
  end

  private

    # TODO: [sriera] doc
    def self.generate_matrix num_cells, colors, symmetry_axes
      
      cells = Array.new
      num_cells.times { |i| cells[i] = []}

      num_cols = symmetry_axes[0] ? (num_cells/2.to_f).ceil : num_cells

      num_rows = symmetry_axes[1] ? (num_cells/2.to_f).ceil : num_cells

      (num_rows*num_cols).to_i.times do |cell|
          
        cell_x = (cell%num_cols)
        cell_y = (cell/num_cols)

        color = colors[rand(colors.length)]
        
        cells[cell_x][cell_y] = color

        if symmetry_axes[0] && num_cells - 1 != 2*cell_x
          cells[num_cells - cell_x - 1][cell_y] = color

          if symmetry_axes[1] && num_cells -1 != 2*cell_y
            cells[num_cells - cell_x - 1][num_cells - cell_y - 1] = color
          end
        end

        if symmetry_axes[1] && num_cells -1 != 2*cell_y
          cells[cell_x][ num_cells - cell_y-1 ] = color
        end

      end

      return cells
    end

    # TODO: [sriera] doc
    def self.generate_svg title, matrix

      # open svg tag
      size = matrix.length
      svg = "<svg xmlns='http://www.w3.org/2000/svg' width='#{size}' height='#{size}'>"

      # set title
      svg += "<title>#{title}</title>" 

      # background with first color
      svg += "<rect width='100%' height='100%' x='0' y='0' fill='#{matrix[0][0]}' stroke='none'/>"

      size.times do |col|
        size.times do |row|
          # draw rect if its color its different than background color
          svg += "<rect fill='#{matrix[col][row]}' stroke='none' fill-rule='nonzero' x='#{col}' y='#{row}' width='1' height='1' />" if matrix[col][row] != matrix[0][0]
        end
      end 

      # close svg tag
      svg += "</svg>"

    end

end
