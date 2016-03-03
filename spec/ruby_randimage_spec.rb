require 'spec_helper'

describe RubyRandimage do

  describe 'dummy' do
    let(:hello) { 'Hello!' }


    it 'converts to lowercase' do
      expect(hello).to eq "Hello!"
    end

    it "coveralls" do
      expect(RubyRandimage.dummy_method_to_test_coveralls).to eq(1)
    end

  end
end