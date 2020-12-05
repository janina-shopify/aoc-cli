module Year2020
  class Day05
    def part1(input)
      seat_list(input).max
    end

    def part2(input)
      seat_list = seat_list(input).sort
      (0..seat_list.length-1).each do |index|
        if seat_list[index + 1] - seat_list[index] == 2
          return seat_list[index] + 1
        end
      end

      # Not as fast as the above, but prettier
      # all_seats = (seat_list.min..seat_list.max).to_set
      # taken_seats = seat_list.to_set
      # all_seats - taken_seats
    end

    def seat_list(input)
      input.split("\n").map {|instr| seat_id(instr)}
    end

    def seat_id(instr)
      row(instr) * 8 + column(instr)
    end

    def row(instr)
      split_range(0, 127, row_instr(instr))
    end

    def column(instr)
      split_range(0, 7, column_instr(instr))
    end

    def row_instr(instr)
      instr[0,7]
    end

    def column_instr(instr)
      instr[7,3]
    end

    def split_range(min, max, instructions)
      if min != max
        half = (max - min + 1) / 2
        low_high = low_high(instructions[0])
        if low_high == 'low'
          split_range(min, max - half, instructions[1, instructions.length-1])
        elsif low_high == 'high'
          split_range(min + half, max, instructions[1, instructions.length-1])
        end
      else
        min
      end
    end

    def low_high(instr)
      if instr == 'F' or instr == 'L'
        'low'
      elsif instr == 'B' or instr == 'R'
        'high'
      end
    end
  end
end
