require './lib/encrypt'
require './lib/decrypt'
require './modules/shiftable'
require 'date'
require 'pry'

class Enigma
include Shiftable
attr_reader :message,
      :cipher_text,
      :key,
      :date

def initialize
  @message     = message
  @cipher_text = cipher_text
  @key         = key
  @date        = date
end

def encrypt(message, key = self.generate, date = self.get_date)
  @message  = message
  @key      = key
  @date     = date
  encrypt = Encrypt.new(@message, @key, @date)
    {
      :encryption => encrypt.encrypted_message,
      :key => key,
      :date => date
    }
end

def decrypt(ciphertext, key, date = self.get_date)
  @ciphertext  = ciphertext
  @key      = key
  @date     = date
  decrypt = Decrypt.new(@ciphertext, @key, @date)

    {
      :decryption => decrypt.decrypted_message,
      :key => key,
      :date => date
    }
  end
end
