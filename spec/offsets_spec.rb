require 'simplecov'
SimpleCov.start
require './lib/offsets'
require 'pry'

RSpec.describe Offsets do
  it 'exists' do
    offset_1 = Offsets.new

    expect(offset_1).to be_an_instance_of(Offsets)
  end

  it 'can square the date given as an argument' do
    offset_1 = Offsets.new
    offset_2 = Offsets.new
    offset_3 = Offsets.new
    date_1 = 92483
    date_2 = 122658
    date_3 = 40895

    expect(offset_1.square(date_1)).to eq(8553105289)
    expect(offset_2.square(date_2)).to eq(15044984964)
    expect(offset_3.square(date_3)).to eq(1672401025)
  end
end
