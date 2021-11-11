require 'simplecov'
SimpleCov.start
require 'date'
require './lib/enigma'
require 'pry'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'can create a character set of lower case letters and a space' do
    enigma = Enigma.new

    expect(enigma.character_set).to be_an(Array)
    expect(enigma.character_set.length).to eq(27)
  end

  it 'can turn a message into an array of lower case characters' do
    enigma = Enigma.new
    message_1 = 'Hello*World'
    message_2 = 'Oh no!'
    message_3 = "My cat's"
    expected_1 = ['h', 'e', 'l', 'l', 'o', '*', 'w', 'o', 'r', 'l', 'd']
    expected_2 = ['o', 'h', ' ', 'n', 'o', '!']
    expected_3 = ["m", "y", " ", "c", "a", "t", "'", "s"]

    expect(enigma.message_array(message_1)).to eq(expected_1)
    expect(enigma.message_array(message_2)).to eq(expected_2)
    expect(enigma.message_array(message_3)).to eq(expected_3)
  end


  xit 'can encrypt a message with a given key and date' do
    enigma = Enigma.new

    encryption = {
              :encryption => 'keder ohulw',
              #the encrypted message
              :key => '02715',
              #the key used for encryption as a string
              :date => '040895'
              #the date used for encryption as a string
    }
    expect(enigma.encrypt('hello world', '02715', '040895')).to eq(encryption)
  end

  xit 'can encrypt a message with a given key and no date given' do
    enigma = Enigma.new

    encryption = {
              :encryption => 'keder ohulw',
              #the encrypted message
              :key => '02715',
              #the key used for encryption as a string
              :date => 'todays date'
              #the date used for encryption as a string
    }
    #date is an optional arg, if date is not included, today's date is used.
    expect(enigma.encrypt('hello world', '02715')).to eq(encryption)
  end

  xit 'can encrypt a message with NO key or date given' do
    enigma = Enigma.new

    encryption = {
              :encryption => 'keder ohulw',
              #the encrypted message
              :key => 'random key',
              #the key used for encryption as a string
              :date => 'todays date'
              #the date used for encryption as a string
    }
    #key is optional arg, if key is not included, a random key is generated.
    #date is an optional arg, if date is not included, today's date is used.
    expect(enigma.encrypt('hello world')).to eq(encryption)
  end

  xit 'can decrypt a message with given key and date' do
    enigma = Enigma.new

    expected = {
              :decryption => 'hello world',
              #the encrypted message
              :key => '02715',
              #the key used for encryption as a string
              :date => '040895'
              #the date used for encryption as a string
    }
    expect(enigma.decrypt(encrypted[:encryption], "02715")).to eq(expected)
  end

  xit 'can decrypt a message with given key and no date given' do
    enigma = Enigma.new

    expected = {
              :decryption => 'hello world',
              #the encrypted message
              :key => '02715',
              #the key used for encryption as a string
              :date => 'todays date'
              #the date used for encryption as a string
    }
    #date is an optional arg, if date is not included, today's date is used.
    expect(enigma.decrypt(encrypted[:encryption], "02715")).to eq(expected)
  end

  xit 'can decrypt a message with NO date or time given' do
    enigma = Enigma.new

    expected = {
              :decryption => 'hello world',
              #the encrypted message
              :key => 'random key',
              #the key used for encryption as a string
              :date => 'todays date'
              #the date used for encryption as a string
    }
    #key is optional arg, if key is not included, a random key is generated.
    #date is an optional arg, if date is not included, today's date is used.
    expect(enigma.decrypt(encrypted[:encryption])).to eq(expected)
  end
end
