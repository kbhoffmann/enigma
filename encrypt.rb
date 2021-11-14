require './lib/enigma'

message_file = File.open(ARGV[0], "r") #
message = message_file.read #
message_file.close #
key = ARGV[2] #
date = ARGV[3] #
encrypting = Enigma.new #
encryption = encrypting.encrypt(message, key, date)

encrypt_file = File.open(ARGV[1], "w") #
encrypt_file.write(encryption[:encryption])
encrypt_file.close

puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
