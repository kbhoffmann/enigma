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

  xit 'can separate random number array into 4 sets of nums' do
    key = Key.new

    expect(key.generate).to
  end
end
