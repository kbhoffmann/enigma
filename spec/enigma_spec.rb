require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'pry'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'can encrypt a message with no key and no date given' do
    enigma = Enigma.new

    expect(enigma.encrypt('hello world')[:encryption]).to be_a(String)
    expect(enigma.encrypt('hello world')[:key].to_i).to be_an(Integer)
    expect(enigma.encrypt('hello world')[:key].length).to eq(5)
    expect(enigma.encrypt('hello world')[:date]).to eq(Date.today.strftime("%d%m%y"))
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

  it 'can use todays date to decrypt if key is given without date' do
    enigma = Enigma.new

    decryption = {
              :decryption => 'hello world',
              :key => '02715',
              :date => Date.today.strftime("%d%m%y")
            }
    encrypted = enigma.encrypt("hello world", "02715")
    expect(enigma.decrypt(encrypted[:encryption], "02715")).to eq(decryption)
  end
end
