require './lib/enigma'

encrypted_file = File.open(ARGV[0], "r")
encrypted_message = encrypted_file.read
encrypted_file.close
key = ARGV[2]
date = ARGV[3]
decrypting = Enigma.new
decryption = decrypting.decrypt(encrypted_message, key, date)

decrypt_file = File.open(ARGV[1], "w")
decrypt_file.write(decryption[:decryption])
decrypt_file.close

puts "Created '#{ARGV[1]}' with the key #{decryption[:key]} and date #{decryption[:date]}."
