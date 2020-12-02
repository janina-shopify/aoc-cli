module Year2020
  class Day02
    def part1(input)
      input.split("\n").inject(0) do |num_valid, line|
        lower, upper, letter, password = line.match(/(\d+)-(\d+)\s([a-z]):\s([a-z]+)/).captures
        (lower.to_i..upper.to_i).include?(password.count(letter)) ? num_valid + 1 : num_valid
      end
    end

    def part2(input)
      input.split("\n").inject(0) do |num_valid, line|
        pos1, pos2, letter, password = line.match(/(\d+)-(\d+)\s([a-z]):\s([a-z]+)/).captures
        (password[pos1.to_i-1] == letter) ^ (password[pos2.to_i-1] == letter) ? num_valid + 1 : num_valid
      end
    end
  end
end
