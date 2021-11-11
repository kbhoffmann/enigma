require 'simplecov'
SimpleCov.start
require './lib/key'
require 'pry'

RSpec.describe Key do
  it 'exists' do
    key_1 = Key.new

    expect(key_1).to be_an_instance_of(Key)
  end

  it 'can generate a random 5 digit number' do
    key_1 = Key.new

    expect(key_1.generate).to be_an(Array)
    expect(key_1.generate.length).to eq(5)
  end
end
