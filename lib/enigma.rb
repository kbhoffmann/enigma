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

end

#need to check if each message character is in character_set
#if true ->shift, if false ->use character as is
#decrypted_message << put new character into

# def shift
#   character_set.rotate(offset + key)
#   #.pop or .push
# end
#===>new decrypted character


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
