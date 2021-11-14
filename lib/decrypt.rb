require 'date'
require './modules/shiftable'

class Decrypt
  include Shiftable
  attr_reader :message, :key, :date, :character_set, :shift_types
  def initialize(message, key, date)
    @message = message.chomp
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
      new_letters[type] = @character_set.zip(@character_set.rotate(-(total_shift(@date)[type] % (@character_set.length)))).to_h
    end
    new_letters
  end

  def decrypted_letter
    translated_characters = {}
    assign_shift_type.map do |type, characters|
      characters.map do |character|
        if check_character(character)
          (translated_characters[type] ||= []) << shifted_letters[type][character]
        else
        (translated_characters[type] ||= []) << character
        end
      end
    end
    translated_characters
  end

  def decrypted_message
     decrypted_letter.values.reduce(&:zip).join
  end

end
