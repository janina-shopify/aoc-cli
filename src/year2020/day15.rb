require 'pp'
module Year2020
  class Day15
    def part1(input)
      do_it(input, 2019)
    end

    def part2(input)
      do_it(input, 29999999)
    end

    def do_it(input, times)
      #input = "0,3,6"
      starting = input.strip().split(",").map(&:to_i)
      history = []

      # last_occurrence[number] = index
      last_occurrence = {}
      last_spoken = nil
      second_last_spoken = nil

      (0..times).each do |i|

        if second_last_spoken
          last_occurrence[second_last_spoken] = i-2
        end

        second_last_spoken = last_spoken

        if i < starting.size
          #history.append(starting[i])
          last_spoken = starting[i]
        else
          #byebug
          # last_time_spoken = last_time_spoken(history[i-1], history)
          last_time_spoken = last_occurrence[last_spoken]
          #byebug
          if !last_time_spoken
            last_spoken = 0
          else
            last_spoken = i-1 - last_time_spoken
          end
          #if !last_time_spoken
            #history.append(0)
          #last_occurrence[0] = i
          #else
          #history.append(i-1 - last_time_spoken)
          #end
        end
        #byebug
      end
      #history.last
      last_spoken
    end

    def last_time_spoken(number, history)
      history_copy = history.clone
      history_copy.pop
      history_copy.rindex(number)
    end
  end
end
