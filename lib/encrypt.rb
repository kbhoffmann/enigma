require 'date'
require_relative '../modules/shiftable'

class Encrypt
  include Shiftable
  attr_reader :message, :key, :date, :character_set, :shift_types
  def initialize(message, key = self.generate, date = self.get_date)
    @message = message
    @key = key
    @date = date.to_i
    @character_set = ("a".."z").to_a << " "
    @shift_types = ["A", "B", "C", "D"]
  end

  def message_array(message)
    message.downcase.split("")
  end

  def check_character(character)
    character_set.include?(character)
  end

  def assign_shift_type
     shift_hash = {}
     message_array(@message).each_with_index do |letter, index|
       type = index % @shift_types.count
        (shift_hash[@shift_types[type]] ||= []) << letter
    end
    shift_hash
  end

  def encrypted_letter
    new_characters = {}
    assign_shift_type.map do |type, letters|
      letters.map do |letter|
        if @character_set.include?(letter)
          (new_characters[type] ||= []) << shifted_letters[type][letter]
        else
        (new_characters[type] ||= []) << letter
        end
      end
    end
    new_characters
  end

  def shifted_letters
    new_letters = {}
    @shift_types.each do |type|
      new_letters[type] = @character_set.zip(@character_set.rotate(total_shift(@date)[type] % (@character_set.length))).to_h
    end
    new_letters
  end

  def translate_message
    encrypted_letter.values.reduce(&:zip).join
    # encrypted_letter.values.reduce do |letter|
    #   letter.zip.join
    # end
  end
end
