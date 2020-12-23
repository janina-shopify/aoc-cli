require 'pp'
require 'byebug'
module Year2020
  class Day13
    def initialize
      @divisors = []
    end

    def part1(input)
      start, buses = input.split("\n")
      start = start.to_i
      buses = buses.split(",").reject{|bus| bus == 'x'}.map(&:to_i)

      bus_id = nil
      timestamp = start
      while true
        earliest = buses.select { |bus_id| timestamp % bus_id == 0 }
        if earliest.size > 0
          bus_id = earliest[0]
          break
        end
        timestamp += 1
      end

      bus_id * (timestamp - start)
    end

    def part2(input)
      #example_timestamp
      real_timestamp(input)
    end

    def real_timestamp(input)
      start, buses = input.split("\n")
      buses = buses.split(",")

      bus_hash = {}
      buses.each_with_index do |bus, i|
        if bus != 'x'
          bus_hash[bus.to_i] = i
        end
      end

      index = 977

      while true
        # ensure all bus ids are divisors of t + their offset
        t = index - 60
        break if bus_hash.all? { |bus_id, offset| get_divisors(t + offset).include?(bus_id) }

        index += 977
      end
      t
    end

    def example_timestamp
      buses = "7,13,x,x,59,x,31,19"
      buses = buses.split(",")

      bus_hash = {}
      buses.each_with_index do |bus, i|
        if bus != 'x'
          bus_hash[bus.to_i] = i
        end
      end

      index = 59
      while true
        # ensure all bus ids are divisors of t + their offset
        t = index - 4
        break if bus_hash.all? { |bus_id, offset| get_divisors(t + offset).include?(bus_id) }

        index += 59
      end
      t
    end

    def get_divisors(num)
      if @divisors[num] == nil
        @divisors[num] = [29, 37, 433, 13, 17, 19, 23, 977, 41].select{ |i| num % i == 0 }
        #@divisors[num] = [7, 13, 59, 31, 19].select{ |i| num % i == 0 }
      else
        @divisors[num]
      end
    end
  end
end
