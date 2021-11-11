#require 'encrypt.rb'
#require 'decrypt.rb'

class Enigma
  #message to encrypt = ARGV0
  #message_file = File.open(ARGV[0], "r")
  #character set - initialize with this??
  #optional key = ARGV2
  #optional date = ARGV3
  #decrypted message = ARGV3

  def character_set
    ("a".."z").to_a << " "
  end

  def message_array(message)
    message.downcase.split("")
  end

  def check_character(character)
    character_set.include?(character)
  end

end

#If check_character true, SHIFT
#if check_character false, new_character = character
#decrypted_message << put new character into

#different shift every 4th character
#if character_set character is at index 0,4,8,12... use A shift
#if character_set character is at index 1,5,9,13...use B shift
#if character_set character is at index 2,6,10,14...use C shift
#if character_set character is at index 3,7,11,15...use D shift

#select index in character_set with message_character
#ie: index position 'a' == message_character 'a'
#character_set.find_index('message_character')
#or index position 'm' == message_character 'm'
#start at that index position, then shift by A,B,C, or D shift

# def shift
#   character_set.rotate(offset + key)
#   #.pop or .push
# end
#===>new decrypted character
#END! encrypted_message << new_decrypted_char

#to read a message to encrypt
#message_data = message_file.read
#message_file.close

#to write to encrypt.rb
#encrypted_message = File.open(ARGV[1], "w")
#encrypted_message.write(method with final encryption returned)
#encrypted_message.close

# Useful Methods
# Array#rotate
# Date#strftime
# Date::today
# Enumerator#with_index”
