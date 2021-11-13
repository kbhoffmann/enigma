require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'pry'

RSpec.describe Enigma do
  it 'exists' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    enigma = Enigma.new(message, key, date)

    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'has a message' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    enigma = Enigma.new(message, key, date)

    expect(enigma.message).to eq("hello world!")
  end

  it 'can take a key as an optional argument' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    enigma = Enigma.new(message, key, date)

    expect(enigma.key).to eq('02715')
  end

  it 'can take a date as an optional argument' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    enigma = Enigma.new(message, key, date)

    expect(enigma.date).to eq('040895')
  end

  it 'has a character set of lower case letters and a space' do
    message = "hello world!"
    key = '2715'
    date = '40895'
    enigma = Enigma.new(message, key, date)

    expect(enigma.character_set).to be_an(Array)
    expect(enigma.character_set.length).to eq(27)
  end

  it 'has a list of 4 shift types' do
    message = "hello world!"
    key = '2715'
    date = '40895'
    enigma = Enigma.new(message, key, date)

    expect(enigma.shift_types).to eq(["A", "B", "C", "D"])
  end

  it 'can turn a message into an array of lower case characters' do
    message = "hello world!"
    key = '2715'
    date = '40895'
    enigma = Enigma.new(message, key, date)
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

  it 'can assign the shift type to each character' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    enigma = Enigma.new(message, key, date)
    expected = {"A"=>["h", "o", "r"], "B"=>["e", " ", "l"], "C"=>["l", "w", "d"], "D"=>["l", "o", "!"]}

    expect(enigma.assign_shift_type).to eq(expected)
  end

  it 'can create hash of shifted letters according to shift type, offset, and key' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    enigma = Enigma.new(message, key, date)

    expect(enigma.shifted_letters).to be_a(Hash)
    expect(enigma.shifted_letters.keys).to eq(["A", "B", "C", "D"])
    expect(enigma.shifted_letters.length).to eq(4)
  end

  it 'can encrypt each letter grouped by type and store them in a hash' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    enigma = Enigma.new(message, key, date)

    expect(enigma.encrypted_letter).to be_a(Hash)
    expect(enigma.encrypted_letter.length).to eq(4)
    expect(enigma.encrypted_letter.values.flatten.length).to eq(message.length)
  end

  it 'can check if a message character is in the characters set' do
   message = "hello world!"
   key = '02715'
   date = '40895'
   enigma = Enigma.new(message, key, date)

   expect(enigma.check_character('a')).to be(true)
   expect(enigma.check_character('m')).to be(true)
   expect(enigma.check_character(" ")).to be(true)
   expect(enigma.check_character("!")).to be(false)
   expect(enigma.check_character(",")).to be(false)
   expect(enigma.check_character("#")).to be(false)
  end

  it 'can combine the encrypted_letters into an encrypted_message' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    enigma = Enigma.new(message, key, date)

   expect(enigma.encrypted_message).to eq('keder ohulw!')
   expect(enigma.encrypted_message.length).to eq(message.length)
 end

 it 'can encrypt a message with a given key and date' do
   message = "hello world"
   key = '02715'
   date = '40895'
   enigma = Enigma.new(message, key, date)

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
