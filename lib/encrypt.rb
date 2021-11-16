require 'date'
require './modules/shiftable'
require './modules/translatable'

class Encrypt
  include Shiftable
  include Translatable
  attr_reader :message, :key, :date, :character_set, :shift_types
  def initialize(message, key = self.generate, date = self.get_date)
    @message = message.chomp
    @key = key
    @date = date
    @character_set = ("a".."z").to_a << " "
    @shift_types = ["A", "B", "C", "D"]
  end

  def shifted_letters
    new_letters = {}
    @shift_types.each do |type|
      new_letters[type] = @character_set.zip(@character_set.rotate(total_shift(@date)[type] % (@character_set.length))).to_h
    end
    new_letters
  end

  def encrypted_letter
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

  def encrypted_message
     encrypted_letter.values.reduce(&:zip).join
  end
end
