require './lib/encrypt'
require './lib/decrypt'
require_relative '../modules/shiftable'
require 'date'
require 'pry'

class Enigma
  include Shiftable

  def encrypt(message, key, date)
    if key.nil?
      key = self.generate
    end
    if date.nil?
      date = self.get_date
    end
    encrypt = Encrypt.new(message, key, date)
      {
        :encryption => encrypt.encrypted_message,
        :key => key,
        :date => date
      }
  end

  def decrypt(message, key, date)
    if date.nil?
      date = self.get_date
    end
    decrypt = Decrypt.new(message, key, date)
      {
        :decryption => decrypt.decrypted_message,
        :key => key,
        :date => date
      }
  end
end
