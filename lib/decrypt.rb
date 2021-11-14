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

  def message_array(message)
    message.downcase.split("")
  end

  def assign_shift_type
     shift_hash = {}
     message_array(@message).each_with_index do |letter, index|
       type = index % @shift_types.count
        (shift_hash[@shift_types[type]] ||= []) << letter
    end
    shift_hash
  end

  def check_character(character)
    @character_set.include?(character)
  end

  def shifted_letters
    new_letters = {}
    @shift_types.each do |type|
      # new_letters[type] = @character_set.zip(@character_set.rotate(total_shift(@date)[type])).to_h
      #new_letters hash [key is shift type, A,B,C,or D] =>
      new_letters[type] = @character_set.zip(@character_set.rotate(total_shift_decrypt(@date)[type] % (@character_set.length))).to_h
                                            #rotate the character set by the total_shift(key + offset) AND shift_type
    end
    new_letters
  end
end
