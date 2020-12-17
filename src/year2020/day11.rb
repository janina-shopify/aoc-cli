require 'pp'
require "active_support"
require "active_support/core_ext/object/deep_dup"
module Year2020
  class Day11
    def initialize
      @offsets = {
        W: [0, -1],
        NW: [-1, -1],
        N: [-1, 0],
        NE: [-1, 1],
        E: [0, 1],
        SE: [1, 1],
        S: [1, 0],
        SW: [1, -1]
      }
    end

    # i - row number
    # j - column number
    def part1(input)
      old_seating = input.split("\n").map {|row| row.split("")}
      new_seating = []
      loop do
        new_seating = old_seating.deep_dup
        (0..old_seating.size-1).each do |i|
          (0..old_seating[i].size-1).each do |j|
            case old_seating[i][j]
            when 'L'
              new_seating[i][j] = '#' if not adjacent_occupied?(i, j, old_seating)
            when '#'
              new_seating[i][j] = 'L' if num_adjacent_occupied(i, j, old_seating) >= 4
            end
          end
        end
        break if old_seating == new_seating

        old_seating = new_seating
      end

      old_seating.flatten.count("#")
    end



    def part2(input)
      old_seating = input.split("\n").map {|row| row.split("")}
      new_seating = []

      loop do
        new_seating = old_seating.deep_dup

        # set up new seating
        (0..old_seating.size-1).each do |i|
          (0..old_seating[i].size-1).each do |j|
            case old_seating[i][j]
            when 'L'
              new_seating[i][j] = '#' if not seat_in_view_occupied?(i, j, old_seating)
            when '#'
              new_seating[i][j] = 'L' if num_seat_in_view_occupied(i, j, old_seating) >= 5
            end
          end
        end

        break if old_seating == new_seating

        old_seating = new_seating
      end

      old_seating.flatten.count("#")
    end

    def adjacent_occupied?(idx_i, idx_j, input)
      num_adjacent_occupied(idx_i, idx_j, input) > 0
    end

    def num_adjacent_occupied(idx_i, idx_j, input)
      adjacent = {
        W: seat(idx_i, idx_j-1, input),
        NW: seat(idx_i-1, idx_j-1, input),
        N: seat(idx_i-1, idx_j, input),
        NE: seat(idx_i-1, idx_j+1, input),
        E: seat(idx_i, idx_j+1, input),
        SE: seat(idx_i+1, idx_j+1, input),
        S: seat(idx_i+1, idx_j, input),
        SW: seat(idx_i+1, idx_j-1, input)
      }

      adjacent_occupied = adjacent.values.reduce(0) do |num_adjacent, seat_val|
        seat_occupied?(seat_val) ? num_adjacent + 1 : num_adjacent
      end

      return adjacent_occupied
    end

    def seat_in_view_occupied?(idx_i, idx_j, seating)
      num_seat_in_view_occupied(idx_i, idx_j, seating) > 0
    end

    def num_seat_in_view_occupied(idx_i, idx_j, seating)
      @offsets.keys.select do |cardinal_direction|
        seat_in_direction_occupied?(cardinal_direction, idx_i, idx_j, seating)
      end.count
    end

    def seat_in_direction_occupied?(cardinal_direction, idx_i, idx_j, seating)
      counter = 1
      i_offset, j_offset = @offsets[cardinal_direction.to_sym]
      while valid_index_for_seating?(idx_i + i_offset * counter, idx_j + j_offset * counter, seating)
        seat = seat(idx_i + i_offset * counter, idx_j + j_offset * counter, seating)

        if is_seat?(seat)
          if seat_occupied?(seat)
            return true
          else
            return false
          end
        end
        counter += 1
      end
      false
    end

    def seat(idx_i, idx_j, seating)
      valid_index_for_seating?(idx_i, idx_j, seating) ? seating[idx_i][idx_j] : nil
    end

    def valid_index_for_seating?(idx_i, idx_j, seating)
      idx_i >= 0 && idx_i < seating.size && idx_j >= 0 && idx_j < seating[0].size
    end

    def is_seat?(seat_val)
      seat_val == "L" or seat_val == "#"
    end

    def seat_occupied?(seat_val)
      if seat_val == nil or seat_val == '.' or seat_val == "L"
        return false
      elsif seat_val == '#'
        return true
      end
    end

    def pp_seating(seating)
      (0..seating.size-1).each do |i|
        (0..seating[i].size-1).each do |j|
          print seating[i][j]
        end
        puts "\n"
      end
      puts "\n\n"
    end
  end
end
