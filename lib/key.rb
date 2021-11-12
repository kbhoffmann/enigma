class Key

  def generate
    5.times.map {rand(0..9)}
  end
  #=> [0, 4, 0, 8, 1]

  def separate_sets
      keys = []
    generate.each_cons(2) do |num|
      keys << num
    end
    keys
  end
  #=>[[5, 8], [8, 4], [4, 6], [6, 1]]


#want
#A => 58,
#B => 84,
#c => 46
#D => 61
  def keys_hash
    hash = Hash.new { |hash, key| hash[key] = [] }
    ('A'..'D').each do |letter|
        separate_sets.each do |set|
          hash[letter] = set.join.to_i
        end
    end
    hash
  end
  #=>{"A"=>77, "B"=>74, "C"=>12, "D"=>62}
end
