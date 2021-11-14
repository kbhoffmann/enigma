require 'date'
require_relative '../modules/shiftable'

class Encrypt
  include Shiftable
  attr_reader :message, :key, :date, :character_set, :shift_types
  def initialize(message, key = self.generate, date = self.get_date)
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

  def shifted_letters
    new_letters = {}
    @shift_types.each do |type|
      # new_letters[type] = @character_set.zip(@character_set.rotate(total_shift(@date)[type])).to_h
      #new_letters hash [key is shift type, A,B,C,or D] =>
      new_letters[type] = @character_set.zip(@character_set.rotate(total_shift(@date)[type] % (@character_set.length))).to_h
                                            #rotate the character set by the total_shift(key + offset) AND shift_type
    end
    new_letters
  end

  def check_character(character)
    @character_set.include?(character)
  end

  def encrypted_letter
    translated_characters = {}
    assign_shift_type.map do |type, characters|
      #type = key of A,B,D,or D  #letters are values of ["e", " ", "l"], etc(4 sets)
      #values are the letters in an array grouped by shift type
      characters.map do |character|
        #letter is each letter in one of the separate arrays
        if check_character(character)
          #first each letter is checked to see if its in the character set
          #if it is in the character set, the letter is translated according to
          #shift type and put into a new translated characters array.
          (translated_characters[type] ||= []) << shifted_letters[type][character]
        else
          #if letter is not in the character set, put the character in the
          #set as it is(not translated).
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
