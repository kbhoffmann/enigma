module Shiftable

  def get_date
    Date.today.strftime("%d%m%y")
  end

  def generate
    5.times.map {rand(0..9)}.join
  end
  #=> [0, 4, 0, 8, 1]

  def separate_sets
      keys = []
    generate.split('').each_cons(2) do |num|
      keys << num
    end
    keys
  end

  def create_keys_hash
    {
      'A' => @key[0..1].to_i,
      'B' => @key[1..2].to_i,
      'C' => @key[2..3].to_i,
      'D' => @key[3..4].to_i
     }
  end

  def square_num(date)
    date.to_i ** 2
  end

  def last_four(date)
    square_num(date).to_s[-4..-1]
  end

  def offset_hash(date)
    {
      'A' => last_four(date)[0].to_i,
      'B' => last_four(date)[1].to_i,
      'C' => last_four(date)[2].to_i,
      'D' => last_four(date)[3].to_i,
     }
  end

  def total_shift(date)
    create_keys_hash.merge!(offset_hash(date)) do |type, key, offset|
      key + offset
    end
  end
end
