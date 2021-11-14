require 'date'
require_relative '../modules/shiftable'

class Decrypt
  include Shiftable
  attr_reader :message, :key, :date, :character_set, :shift_types
  def initialize(message, key = self.generate, date = self.get_date)
    @message = message
    @key = key
    @date = date.rjust(6, "0")
    @character_set = ("a".."z").to_a << " "
    @shift_types = ["A", "B", "C", "D"]
  end

end
