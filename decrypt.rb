#Additionally, you should create a Runner file called decrypt.rb that takes four command line arguments.
#The first is an existing file that contains an encrypted message.
#The second is a file where your program should write the decrypted message.
#The third is the key to be used for decryption.
#The fourth is the date to be used for decryption.
#In addition to writing the decrypted message to the file,
#your program should output to the screen the file it wrote to,
#the key used for decryption, and the date used for decryption.

#ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
#ARGV0 => encrypted.txt
#ARGV1 => decrypted.txt
#ARGV2 => key
#ARGV3 => date

# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
# Created 'decrypted.txt' with the key 82648 and date 240818
puts "Created #{ARGV[1]} with the key #{ARGV[2]} and the date #{ARGV[3]}"
