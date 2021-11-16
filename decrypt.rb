require './lib/enigma'

encrypted_file = File.open(ARGV[0], "r")
ciphertext = encrypted_file.read
encrypted_file.close

decrypting = Enigma.new
decryption = decrypting.decrypt(ciphertext, ARGV[2], date = ARGV[3] ||= Date.today.strftime("%d%m%y"))

decrypt_file = File.open(ARGV[1], "w")
decrypt_file.write(decryption[:decryption])
decrypt_file.close

puts "Created '#{ARGV[1]}' with the key #{decryption[:key]} and date #{decryption[:date]}"
