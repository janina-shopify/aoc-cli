module Year2020
  class Day03
    def part1(input)
      num_trees(input, 3, 1)
    end

    def part2(input)
      num_trees(input, 1, 1) *
        num_trees(input, 3, 1) *
        num_trees(input, 5, 1) *
        num_trees(input, 7, 1) *
        num_trees(input, 1, 2)
    end

    private

    def num_trees(input, x_inc, y_inc)
      lines = input.split("\n")
      line_length = lines[0].length
      x = y = num_trees = 0
      while lines[y]
        if lines[y][x % line_length] == '#'
          num_trees += 1
        end
        x += x_inc
        y += y_inc
      end
      num_trees
    end
  end
end
