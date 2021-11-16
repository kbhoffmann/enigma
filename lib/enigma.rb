require './lib/encrypt'
require './lib/decrypt'
require './modules/shiftable'
require 'date'
require 'pry'

class Enigma
include Shiftable

  def encrypt(message, key = self.generate, date = self.get_date)
    encrypt = Encrypt.new(message, key, date)
      {
        :encryption => encrypt.encrypted_message,
        :key => key,
        :date => date
      }
  end

def decrypt(ciphertext, key, date = self.get_date)
  decrypt = Decrypt.new(ciphertext, key, date)

    {
      :decryption => decrypt.decrypted_message,
      :key => key,
      :date => date
    }
  end
end
