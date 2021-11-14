require './lib/encrypt'
require 'date'
require 'pry'

class Enigma

  def encrypt(message, key = encrypt.key, date = encrypt.date)
    encrypt = Encrypt.new(message, key, date)
      {
        :encryption => encrypt.encrypted_message,
        :key =>  key,
        :date => date
      }
  end
end
