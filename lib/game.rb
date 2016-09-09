require 'poke'

def game(pokes)
  possible_board = pokes.combination(5).to_a
  possible_board.map {|board| compute_result(board)}.min
end

def compute_result(pokes)
  duplicate_cards_sort = duplicate_cards(pokes).values.sort
  flush = flush?(pokes)
  straight = straight?(pokes)
  has_max_card = has_max_card?(pokes)

  return 0 if has_max_card && straight && flush

  return 1 if straight && flush

  return 2 if duplicate_cards_sort == [1, 4]

  return 3 if duplicate_cards_sort == [2, 3]

  return 4 if flush && duplicate_cards_sort == [1, 1, 1, 1, 1]

  return 5 if straight

  return 6 if duplicate_cards_sort == [1, 1, 3]

  return 7 if duplicate_cards_sort == [1, 2, 2]

  return 8 if duplicate_cards_sort == [1, 1, 1, 2]

  return 9 if duplicate_cards_sort == [1, 1, 1, 1, 1]

end

def duplicate_cards(pokes)
  dup = {}
  pokes.each do |poke|
    next if dup.has_key?(poke.num)
    dup[poke.num] = pokes.map(&:num).count(poke.num)
  end
  dup
end

def flush?(pokes)
  pokes.map(&:color).uniq.size == 1
end

def has_max_card?(pokes)
  pokes.any? {|poke| poke.num == "A"}
end

def straight?(pokes)
  int_nums = num_to_int(pokes)
  int_nums.reduce(:+) == int_nums.min * 5 + 10
end

def num_to_int(pokes)
  int_array = []
  pokes.each do |poke|
    case poke.num
    when "A"
      int_array << 14
    when "J"
      int_array << 11
    when "Q"
      int_array << 12
    when "K"
      int_array << 13
    else
      int_array << poke.num.to_i
    end
  end

  int_array
end
