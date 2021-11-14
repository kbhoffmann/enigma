module Translatable

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
end
