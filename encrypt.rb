# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
#message.txt is ARGV0
#encrypted.txt is ARGV1
# Created 'encrypted.txt' with the key 82648 and date 240818

#message file to encrypt => ARGV0
#file to write encrypted message => ARGV1
message_file = File.open(ARGV[0], "r")
message_date = message_file.read
message_file.close

message = Enigma.new
#???????encryption = encrypt.encrypted_message

encryption_file = File.open(ARGV[1], "w")
encryption_file.write(encryption)
encryption_file.close

#key and date path????? enigma class?
#key =
#date =

puts "Created #{ARGV[1]} with the key #{key} and date #{date}"
