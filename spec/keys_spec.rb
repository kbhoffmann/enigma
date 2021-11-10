require 'simplecov'
SimpleCov.start
require './lib/keys'
require 'pry'

RSpec.describe Keys do
  it 'exists' do
    key_1 = Keys.new

    expect(key_1).to be_an_instance_of(Keys)
  end
end
