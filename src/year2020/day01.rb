module Year2020
  class Day01
    def part1(input)
      input = input.split("\n").map!{|val| val.to_i}
      (0..input.length-1).each do |i|
        (i+1..input.length-1).each do |j|
          if input[i]+ input[j] == 2020
            return input[i] * input[j]
          end
        end
      end
    end

    def part2(input)
      input = input.split("\n").map!{|val| val.to_i}
      (0..input.length-1).each do |i|
        (i+1..input.length-1).each do |j|
          (j+1..input.length-1).each do |k|
            if input[i]+ input[j] + input[k] == 2020
              return input[i] * input[j] * input[k]
            end
          end
        end
      end
    end
  end
end
