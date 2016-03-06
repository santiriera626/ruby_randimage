require 'spec_helper'

describe RubyRandimage do
  
  before(:all) do
    @@blob = []
    @@result = []
  end

  describe 'dummy' do

    # TODO: [sriera] Eliminar antes de build
    it "text" do
      25.times do |i|
        RubyRandimage.create_and_save_file "temp_image_#{i}.svg" , { :title=>"image_#{i}", :colors=> ["#aaaaaa", "#990000"], symmetry_axes: [true, true], grid_size: 5}
      end
    
    end

    it "creates a svg file" do
      @@blob = RubyRandimage.create
      expect(@@blob).to be_a_kind_of(String)
    end

    it "creates an image file" do
      @@result = RubyRandimage.create_and_save_file("tmp/test_image.svg")
      expect(@@result).to be_truthy
    end

    it "does not create a svg image with an invalid grid size" do
      lambda { RubyRandimage.create(grid_size: 2) }.should raise_exception('grid_size must be between 4 and 9')
      lambda { RubyRandimage.create(grid_size: 10) }.should raise_exception('grid_size must be between 4 and 9')
    end

    it "does not create a svg image with an invalid title" do
      lambda { RubyRandimage.create({title: nil}) }.should raise_exception('title is invalid')
      lambda { RubyRandimage.create({title: ''}) }.should raise_exception('title is invalid')
    end
  end
end