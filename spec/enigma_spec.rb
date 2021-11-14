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

    encrypted = {
              :encryption => 'keder ohulw',
              :key => '02715',
              :date => '040895'
               }
    expect(enigma.encrypt('hello world','02715','040895')).to eq(encrypted)
  end

  it 'can encrypt a message with a given key and no date given' do
    enigma = Enigma.new

    encrypted = {
              :encryption => 'pkfawfqdzry',
              :key => '02715',
              :date => Date.today.strftime("%d%m%y")
              }

    expect(enigma.encrypt('hello world','02715', date = nil)).to eq(encrypted)
  end

  it 'can decrypt a message with given key and date' do
    enigma = Enigma.new

    decryption = {
              :decryption => 'hello world',
              :key => '02715',
              :date => '040895'
                  }

    expect(enigma.decrypt('keder ohulw','02715','040895')).to eq(decryption)
  end

  xit 'can use todays date to decrypt if key is given without date' do
    enigma = Enigma.new

    decryption = {
              :decryption => 'hello world',
              :key => '02715',
              :date => Date.today.strftime("%d%m%y")
            }

    expect(enigma.decrypt(encrypted[:encryption], date = nil)).to eq(decryption)
  end
end



#How do you test for randomness?
# xit 'can encrypt a message with NO key or date given' do
#   enigma = Enigma.new
#
#   encryption = {
#             :encryption => "Some String",
#             #the encrypted message
#             :key => "Some key",
#             #the key used for encryption as a string
#             :date => Date.today.strftime("%d%m%y")
#             #the date used for encryption as a string
#   }
#   #key is optional arg, if key is not included, a random key is generated.
#   #date is an optional arg, if date is not included, today's date is used.
#   expect(enigma.encrypt('hello world')).to eq(encryption)
#   end
