require 'simplecov'
SimpleCov.start
require './lib/key'
require 'pry'

RSpec.describe Key do
  it 'exists' do
    key = Key.new

    expect(key).to be_an_instance_of(Key)
  end

  it 'can generate a random 5 digit number' do
    key = Key.new

    expect(key.generate).to be_an(Array)
    expect(key.generate.length).to eq(5)
  end

  it 'can separate random number array into 4 sets of nums' do
    key = Key.new

    expect(key.separate_sets).to be_an(Array)
    expect(key.separate_sets.length).to eq(4)
  end

  it 'can create a hash of keys A thru D with sep. sets as values' do
    key = Key.new

    expect(key.create_keys_hash).to be_a(Hash)
    expect(key.create_keys_hash.count).to eq(4)
  end
end
