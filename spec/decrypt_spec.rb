require 'simplecov'
SimpleCov.start
require './lib/decrypt'
require 'pry'

RSpec.describe Decrypt do
  it 'exists' do
    message = "keder ohulw!!"
    key = '02715'
    date = '040895'
    decrypt = Decrypt.new(message, key, date)

    expect(decrypt).to be_an_instance_of(Decrypt)
  end

  it 'has a message' do
    message = "keder ohulw!"
    key = '02715'
    date = '040895'
    decrypt = Decrypt.new(message, key, date)

    expect(decrypt.message).to eq("keder ohulw!")
  end

  it 'can take a key as an optional argument' do
    message = "keder ohulw!"
    key = '02715'
    date = '040895'
    decrypt = Decrypt.new(message, key, date)

    expect(decrypt.key).to eq('02715')
  end

  it 'can take a date as an optional argument' do
    message = "keder ohulw!"
    key = '02715'
    date = '040895'
    decrypt = Decrypt.new(message, key, date)

    expect(decrypt.date).to eq('040895')
  end

  it 'has a character set of lower case letters and a space' do
    message = "keder ohulw!"
    key = '2715'
    date = '040895'
    decrypt = Decrypt.new(message, key, date)

    expect(decrypt.character_set).to be_an(Array)
    expect(decrypt.character_set.length).to eq(27)
  end

  it 'has a list of 4 shift types' do
    message = "keder ohulw!"
    key = '2715'
    date = '040895'
    decrypt = Decrypt.new(message, key, date)

    expect(decrypt.shift_types).to eq(["A", "B", "C", "D"])
  end

  it 'can turn a message into an array of lower case characters' do
    message = "keder ohulw!"
    key = '2715'
    date = '040895'
    decrypt = Decrypt.new(message, key, date)
    message_1 = 'Hello*World'
    message_2 = 'Oh no!'
    message_3 = "My cat's"
    expected_1 = ['h', 'e', 'l', 'l', 'o', '*', 'w', 'o', 'r', 'l', 'd']
    expected_2 = ['o', 'h', ' ', 'n', 'o', '!']
    expected_3 = ["m", "y", " ", "c", "a", "t", "'", "s"]

    expect(decrypt.message_array(message_1)).to eq(expected_1)
    expect(decrypt.message_array(message_2)).to eq(expected_2)
    expect(decrypt.message_array(message_3)).to eq(expected_3)
  end

  it 'can assign the shift type to each character' do
    message = "keder ohulw!"
    key = '02715'
    date = '040895'
    decrypt = Decrypt.new(message, key, date)
    expected = {"A"=>["k", "r", "u"], "B"=>["e", " ", "l"], "C"=>["d", "o", "w"], "D"=>["e", "h", "!"]}
    expect(decrypt.assign_shift_type).to eq(expected)
  end

  it 'can create hash of shifted letters according to shift type, offset, and key' do
    message = "keder ohulw!"
    key = '02715'
    date = '040895'
    decrypt = Decrypt.new(message, key, date)

    expect(decrypt.shifted_letters).to be_a(Hash)
    expect(decrypt.shifted_letters.keys).to eq(["A", "B", "C", "D"])
    expect(decrypt.shifted_letters.length).to eq(4)
  end

  it 'can decrypt each letter grouped by type and store them in a hash' do
    message = "keder ohulw!"
    key = '02715'
    date = '040895'
    decrypt = Decrypt.new(message, key, date)

    expect(decrypt.decrypted_letter).to be_a(Hash)
    expect(decrypt.decrypted_letter.length).to eq(4)
    expect(decrypt.decrypted_letter.values.flatten.length).to eq(message.length)
  end

  it 'can check if a message character is in the characters set' do
   message = "keder ohulw!"
   key = '02715'
   date = '040895'
   decrypt = Decrypt.new(message, key, date)

   expect(decrypt.check_character('a')).to be(true)
   expect(decrypt.check_character('m')).to be(true)
   expect(decrypt.check_character(" ")).to be(true)
   expect(decrypt.check_character("!")).to be(false)
   expect(decrypt.check_character(",")).to be(false)
   expect(decrypt.check_character("#")).to be(false)
  end

  it 'can combine the decrypted_letters into an decrypted_message' do
    message = "keder ohulw!"
    key = '02715'
    date = '040895'
    decrypt = Decrypt.new(message, key, date)

   expect(decrypt.decrypted_message).to eq('hello world!')
   expect(decrypt.decrypted_message.length).to eq(message.length)
 end
end
