require 'spec_helper'

describe RubyRandimage do
  
  describe 'dummy' do

    # TODO: [sriera] Eliminar antes de build
    it "text" do
      25.times do |i|
        RubyRandimage.create_and_save_file "temp_image_#{i}.svg" , { :title=>"image_#{i}", :colors=> ["#ffffff","#ffffff","#ffffff", "#770000", "#550000", "#990000", "#990000", "#990000"], :symmetry_axes=> [true, true], :num_cells=> 10}
      end
    end

    it "creates a svg" do
      svg_string = RubyRandimage.create
      expect(svg_string).to be_a_kind_of(String)
    end
    
    it "creates a two equal svg with same seed value" do
      svg_string = RubyRandimage.create :seed=> 5875
      svg_string2 = RubyRandimage.create :seed=> 5875
      expect(svg_string).to eq(svg_string2)
    end

    it "creates a svg without simetry" do
      svg_string = RubyRandimage.create({ :symmetry_axes=> [false, false] })
      expect(svg_string).to be_a_kind_of(String)
    end

    it "creates a svg with horizontal simetry" do
      svg_string = RubyRandimage.create({ :symmetry_axes=> [true, false] })
      expect(svg_string).to be_a_kind_of(String)
    end

    it "creates a svg with vertical simetry" do
      svg_string = RubyRandimage.create({ :symmetry_axes=> [false, true] })
      expect(svg_string).to be_a_kind_of(String)
    end

    it "creates a svg with horizontal and vertical simetry" do
      svg_string = RubyRandimage.create({ :symmetry_axes=> [false, true] })
      expect(svg_string).to be_a_kind_of(String)
    end

    it "creates an svg file" do
      result = RubyRandimage.create_and_save_file("tmp/test_image.svg")
      expect(result).to be_truthy
    end

    it "raise an exception with an invalid num_cells" do
      expect{RubyRandimage.create(:num_cells=> 1)}.to raise_exception('num_cells must be between 2 and 16')
      expect{RubyRandimage.create(:num_cells=> 17)}.to raise_exception('num_cells must be between 2 and 16')
    end

    it "raise an exception with an invalid title" do
      expect{RubyRandimage.create(:title=> nil)}.to raise_exception('title is invalid')
      expect{RubyRandimage.create(:title=> '')}.to raise_exception('title is invalid')
    end

    it "raise an exception with an invalid symmetry_axes" do
      expect{RubyRandimage.create(:symmetry_axes=> nil)}.to raise_exception('symmetry_axes must be a two elemnts array')
      expect{RubyRandimage.create(:symmetry_axes=> [true])}.to raise_exception('symmetry_axes must be a two elemnts array')
    end

    it "raise an exception with an invalid colors" do
      expect{RubyRandimage.create(:colors=> nil)}.to raise_exception('colors must be an array with at least two elemments')
      expect{RubyRandimage.create(:colors=> ["#ffffff"])}.to raise_exception('colors must be an array with at least two elemments')
    end

    it "raise an exception with an invalid seed" do
      expect{RubyRandimage.create(:seed=> "seed")}.to raise_exception('seed is invalid, must be nil or fixnum')
    end

  end
end