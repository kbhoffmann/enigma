require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'pry'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_an_instance_of(Enigma)
  end
end
