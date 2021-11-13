require './lib/encrypt'
require 'pry'

RSpec.describe Encrypt do
  it 'exists' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt).to be_an_instance_of(Encrypt)
  end

  it 'has a message' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.message).to eq("hello world!")
  end

  it 'can take a key as an optional argument' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.key).to eq('02715')
  end

  it 'can take a date as an optional argument' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.date).to eq(40895)
  end

  it 'has a character set of lower case letters and a space' do
    message = "hello world!"
    key = '2715'
    date = '40895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.character_set).to be_an(Array)
    expect(encrypt.character_set.length).to eq(27)
  end

  it 'has a list of 4 shift types' do
    message = "hello world!"
    key = '2715'
    date = '40895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.shift_types).to eq(["A", "B", "C", "D"])
  end

  it 'can turn a message into an array of lower case characters' do
    message = "hello world!"
    key = '2715'
    date = '40895'
    encrypt = Encrypt.new(message, key, date)
    message_1 = 'Hello*World'
    message_2 = 'Oh no!'
    message_3 = "My cat's"
    expected_1 = ['h', 'e', 'l', 'l', 'o', '*', 'w', 'o', 'r', 'l', 'd']
    expected_2 = ['o', 'h', ' ', 'n', 'o', '!']
    expected_3 = ["m", "y", " ", "c", "a", "t", "'", "s"]

    expect(encrypt.message_array(message_1)).to eq(expected_1)
    expect(encrypt.message_array(message_2)).to eq(expected_2)
    expect(encrypt.message_array(message_3)).to eq(expected_3)
  end

  it 'can assign the shift type to each character' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    encrypt = Encrypt.new(message, key, date)
    expected = {"A"=>["h", "o", "r"], "B"=>["e", " ", "l"], "C"=>["l", "w", "d"], "D"=>["l", "o", "!"]}

    expect(encrypt.assign_shift_type).to eq(expected)
  end

  it 'can create hash of shifted letters according to shift type, offset, and key' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.shifted_letters).to be_a(Hash)
    expect(encrypt.shifted_letters.keys).to eq(["A", "B", "C", "D"])
    expect(encrypt.shifted_letters.length).to eq(4)
  end

  it 'can encrypt each letter grouped by type and store them in a hash' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.encrypted_letter).to be_a(Hash)
    expect(encrypt.encrypted_letter.length).to eq(4)
    expect(encrypt.encrypted_letter.values.flatten.length).to eq(message.length)
  end

  it 'can combine the encrypted_letters into an encrypted_message' do 
    message = "hello world!"
    key = '02715'
    date = '40895'
    encrypt = Encrypt.new(message, key, date)

   expect(encrypt.encrypted_message).to eq('keder ohulw!')
   expect(encrypt.encrypted_message.length).to eq(message.length)
 end
end


# xit 'can check if a message character is in the characters set' do
#   message = "hello world!"
#   key = 2715
#   date = 40895
#   encrypt = Encrypt.new
#
#   expect(encrypt.check_character('a')).to be(true)
#   expect(encrypt.check_character('m')).to be(true)
#   expect(encrypt.check_character(" ")).to be(true)
#   expect(encrypt.check_character("!")).to be(false)
#   expect(encrypt.check_character(",")).to be(false)
#   expect(encrypt.check_character("#")).to be(false)
#   end


# xit 'can determine shift type of letter in message array' do
#   message = "hello world!"
#   key = 2715
#   date = 40895
#   encrypt = Encrypt.new
#
#   message_array_1 = ['h', 'e', 'l', 'l', 'o']
#   message_array_2 = ['b', 'i', 'r', 'd', 'i', 'e']
#     expect(encrypt.shift_type(['d'])).to eq(['A'])
#     expect(encrypt.shift_type(['h','i'])).to eq(['A','B'])
#     expect(encrypt.shift_type(['c', 'o', 'w'])).to eq(['A','B','C'])
#     expect(encrypt.shift_type(['b', 'i', 'r', 'd'])).to eq(['A','B','C','D'])
    # expect(encrypt.shift_type(message_array_1)).to eq(['A','B','C','D','A'])
    # expect(encrypt.shift_type(message_array_2)).to eq(['A','B','C','D','A','B'])
# end

# it 'can shift characters according to shift type' do
#   message = "hello world!"
#   key = 2715
#   date = 40895
#   encrypt = Encrypt.new(message)
#
#   type_a = 3  #=>offset + key
#   type_b = 27
#   type_c = 73
#   type_d = 20
#   expect(encrypt.encrypted_letter("h", type_a)).to eq("k")
#   expect(encrypt.encrypted_letter("e", type_b)).to eq("e")
#   expect(encrypt.encrypted_letter("l", type_c)).to eq("d")
#   expect(encrypt.encrypted_letter("l", type_d)).to eq("e")
#   expect(encrypt.encrypted_letter("o", type_a)).to eq("r")
#   expect(encrypt.encrypted_letter(" ", type_b)).to eq(" ")
#   expect(encrypt.encrypted_letter("w", type_c)).to eq("o")
#   expect(encrypt.encrypted_letter("o", type_d)).to eq("h")
#   expect(encrypt.encrypted_letter("r", type_a)).to eq("u")
#   expect(encrypt.encrypted_letter("l", type_b)).to eq("l")
#   expect(encrypt.encrypted_letter("d", type_c)).to eq("w")
  #"!" would  not shift since its not in character_set
  # expect(encrypt.shift("d", type_d)).to eq("!")
