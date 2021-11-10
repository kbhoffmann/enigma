require 'simplecov'
SimpleCov.start
require './lib/offsets'
require 'pry'

RSpec.describe Offsets do
  it 'exists' do
    offset_1 = Offsets.new

    expect(offset_1).to be_an_instance_of(Offsets)
  end
end
