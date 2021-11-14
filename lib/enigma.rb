require './lib/encrypt'
require_relative '../modules/shiftable'
require 'date'
require 'pry'

class Enigma
  include Shiftable

  attr_reader #:key, :date #:message, :cipher_text,
  def initialize
    # @message = message
    # @cipher_text = cipher_text
    # @key = key
    # @date = date
  end

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
end
