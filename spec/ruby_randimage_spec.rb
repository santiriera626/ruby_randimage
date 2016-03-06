require 'spec_helper'

describe RubyRandimage do

  describe 'dummy' do


    it "text" do
      25.times do |i|
        RubyRandimage.create_and_save_file "temp_image_#{i}.svg"
      end
      expect("hola").to eq("hola")
    
    end


  end
end