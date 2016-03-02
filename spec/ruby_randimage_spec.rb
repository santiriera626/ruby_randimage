require 'spec_helper'

describe RubyRandimage do

  describe 'dummy' do
    let(:hello) { 'Hello!' }


    it 'converts to lowercase' do
      expect(hello).to eq "Hello!"
    end
  end
end