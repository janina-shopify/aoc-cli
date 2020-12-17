require 'pp'
module Year2020
  class Day
    def part1(input)
      differences = [0, 0, 0]
      input = ("0\n"+input).split("\n").map(&:to_i).sort
      input.append(input.last+3)


      (0..input.size-1).each do |i|
        (i+1..i+3).each do |j|
          if j < input.size
            difference = input[j] - input[i]
            if difference <=3
              differences[difference-1] += 1
              break
            end
          else
            break
          end
        end
      end
      differences[0]*differences[2]
    end

    def part2(input)
      input = <<-INPUT
28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3
      INPUT
      input = ("0\n"+input).split("\n").map(&:to_i).sort
      input.append(input.last+3)
      puts input.size

      #input.size
      combination_valid?(fewest(input))
      low = fewest(input).size

      counter = 0
      (low..input.size).each do |i|
        puts i
        PP.pp(input.combination(99).to_a.size)
        puts input.combination(i).to_a.size
        temp = input.combination(i).to_a.reduce(0) do |count_valid, item|
          combination_valid?(item) ? count_valid += 1 : count_valid
        end
        puts temp
        counter += temp
      end
      counter


    end

    def fewest(input)
      i = 0
      arr = []
      curr = 0

      until i+1 >= input.size do
        (i+1..i+3).each do |j|

          if j < input.size
            difference = input[j] - input[i]
            if difference <= 3
              curr = j
            end
          end
        end

        arr.append(curr)
        i = curr
      end
      arr
    end

    def combination_valid?(arr)
      (0..arr.size-2).each do |i|
        if arr[i+1]-arr[i] > 3
          return false
        end
      end
      true
    end
  end
end
