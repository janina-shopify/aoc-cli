require 'pp'
module Year2020
  class Day06
    def part1(input)
      input.split("\n\n").reduce(0) do |sum, group|
        group.split("\n").reduce do |answers, person|
          answers + person
        end.split("").uniq.count + sum
      end
    end

    def part2(input)
      part2_2(input)
    end

    def part2_1(input)
      input.split("\n\n").reduce(0) do |sum, group|
        people = group.split("\n")

        people.reduce(people[0].split("")) do |answers, person|
          answers & person.split("")
        end.count + sum
      end
    end

    def part2_2(input)
      input.split("\n\n").reduce(0) do |sum, group|
        people = group.split("\n")
        group_size = people.size

        people.map {|person| person.split("")}.flatten.reduce(Hash.new(0)) do |hash, val|
          hash[val] += 1
          hash
        end.values.count{|n| n == group_size} + sum
      end
    end
  end
end
