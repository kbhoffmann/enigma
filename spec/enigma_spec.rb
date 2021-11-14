require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'pry'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'can encrypt a message with a given key and date' do
    enigma = Enigma.new

    encryption = {
              :encryption => 'keder ohulw',
              #the encrypted message
              :key => '02715',
              #the key used for encryption as a string
              :date => '040895'
              #the date used for encryption as a string
                  }
    expect(enigma.encrypt("hello world",'02715','40895')).to eq(encryption)
  end
end
