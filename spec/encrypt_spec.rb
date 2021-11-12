it 'can create a character set of lower case letters and a space' do
  encrypt = Encrypt.new

  expect(encrypt.character_set).to be_an(Array)
  expect(encrypt.character_set.length).to eq(27)
end

it 'can turn a message into an array of lower case characters' do
  encrypt = Encrypt.new
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

it 'can check if a message character is in the characters set' do
  encrypt = Encrypt.new

  expect(encrypt.check_character('a')).to be(true)
  expect(encrypt.check_character('m')).to be(true)
  expect(encrypt.check_character(" ")).to be(true)
  expect(encrypt.check_character("!")).to be(false)
  expect(encrypt.check_character(",")).to be(false)
  expect(encrypt.check_character("#")).to be(false)
end

it 'can determine shift type of letter in message array' do
  encrypt = Encrypt.new

  message_array_1 = ['h', 'e', 'l', 'l', 'o']
  message_array_2 = ['b', 'i', 'r', 'd', 'i', 'e']
    expect(encrypt.shift_type(['d'])).to eq(['A'])
    expect(encrypt.shift_type(['h','i'])).to eq(['A','B'])
    expect(encrypt.shift_type(['c', 'o', 'w'])).to eq(['A','B','C'])
    expect(encrypt.shift_type(['b', 'i', 'r', 'd'])).to eq(['A','B','C','D'])
    # expect(encrypt.shift_type(message_array_1)).to eq(['A','B','C','D','A'])
    # expect(encrypt.shift_type(message_array_2)).to eq(['A','B','C','D','A','B'])
end

it 'can shift characters according to shift type' do
  encrypt = Encrypt.new

  type_a = 3
  type_b = 27
  type_c = 73
  type_d = 20
  expect(encrypt.encrypted_letter("h", type_a)).to eq("k")
  expect(encrypt.encrypted_letter("e", type_b)).to eq("e")
  expect(encrypt.encrypted_letter("l", type_c)).to eq("d")
  expect(encrypt.encrypted_letter("l", type_d)).to eq("e")
  expect(encrypt.encrypted_letter("o", type_a)).to eq("r")
  expect(encrypt.encrypted_letter(" ", type_b)).to eq(" ")
  expect(encrypt.encrypted_letter("w", type_c)).to eq("o")
  expect(encrypt.encrypted_letter("o", type_d)).to eq("h")
  expect(encrypt.encrypted_letter("r", type_a)).to eq("u")
  expect(encrypt.encrypted_letter("l", type_b)).to eq("l")
  expect(encrypt.encrypted_letter("d", type_c)).to eq("w")
  #"!" would  not shift since its not in character_set
  # expect(encrypt.shift("d", type_d)).to eq("!")
end
