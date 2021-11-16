require 'simplecov'
SimpleCov.start
require './lib/encrypt'
require 'pry'

RSpec.describe Encrypt do
  it 'exists' do
    message = "hello world!"
    key = '02715'
    date = '040895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt).to be_an_instance_of(Encrypt)
  end

  it 'can get the date' do
    message = "hello world!"
    key = '02715'
    date = '040895'
    encrypt = Encrypt.new(message, key, date)
    expected = Date.today.strftime("%d%m%y")

    expect(encrypt.get_date).to eq(expected)
  end

  it 'can generate a random number for the key' do
    message = "hello world!"
    key = '02715'
    date = '040895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.generate).to be_a(String)
    expect(encrypt.generate.length).to eq(5)
  end

  it 'can separate a random number into four separate sets of numbers' do
    message = "hello world!"
    key = '02715'
    date = '040895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.separate_sets).to be_an(Array)
    expect(encrypt.separate_sets.length).to eq(4)
  end

  it 'has a message' do
    message = "hello world!"
    key = '02715'
    date = '040895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.message).to eq("hello world!")
  end

  it 'can take a key as an optional argument' do
    message = "hello world!"
    key = '02715'
    date = '040895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.key).to eq('02715')
  end

  it 'can take a date as an optional argument' do
    message = "hello world!"
    key = '02715'
    date = '040895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.date).to eq('040895')
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

  it 'can calculate the total shift per shift type' do
    message = "hello world!"
    key = '02715'
    date = '40895'
    encrypt = Encrypt.new(message, key, date)

    expect(encrypt.total_shift(date)).to be_a(Hash)
    expect(encrypt.total_shift(date).length).to eq(4)
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

  it 'can check if a message character is in the characters set' do
   message = "hello world!"
   key = '02715'
   date = '40895'
   encrypt = Encrypt.new(message, key, date)

   expect(encrypt.check_character('a')).to be(true)
   expect(encrypt.check_character('m')).to be(true)
   expect(encrypt.check_character(" ")).to be(true)
   expect(encrypt.check_character("!")).to be(false)
   expect(encrypt.check_character(",")).to be(false)
   expect(encrypt.check_character("#")).to be(false)
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
