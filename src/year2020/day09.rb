module Year2020
  class Day09
    def part1(input)
      input = input.split("\n").map(&:to_i)
      (25..input.size-1).each do |i|
        return input[i] if not valid?(input[i], input[i-25, 25])
      end
    end

    def part2(input)
      input = input.split("\n").map(&:to_i)
      wanted = 776203571
      (0..input.size-1).each do |i|
        (i+1..input.size-1).each do |j|
          if input[i..j].reduce(:+) == wanted
            return input[i..j].min + input[i..j].max
          end
        end
      end
    end

    def valid?(num, against)
      (0..against.size-1).each do |j|
        (j+1..against.size-1).each do |k|
          return true if against[j] + against[k] == num
        end
      end
      false
    end
  end
end
