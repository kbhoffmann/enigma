class Key

  def generate
    5.times.map {rand(0..10)}
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

  def create_keys_hash
    hash = Hash.new { |hash, key| hash[key] = [] }
    ('A'..'D').each do |letter|
        separate_sets.each do |set|
          hash[letter] = set
        end
    end
    hash
  end
  #=> {"A"=>[7, 7], "B"=>[1, 2], "C"=>[10, 3], "D"=>[3, 0]}
end
