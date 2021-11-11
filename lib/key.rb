class Key

  def generate
    5.times.map {rand(10)}
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
end
