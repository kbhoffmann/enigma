require './lib/encrypt'
require_relative '../modules/shiftable'
require 'date'
require 'pry'

class Enigma
  include Shiftable

  attr_reader :key, :date #:message, :cipher_text,
  def initialize
    @message = message
    # @cipher_text = cipher_text
    @key = key
    @date = date
  end

  def encrypt(message, key = self.generate, date = self.get_date)
    encrypt = Encrypt.new(message, key, date)
      {
        :encryption => encrypt.encrypted_message,
        :key => key,
        :date => date
      }
  end
end
