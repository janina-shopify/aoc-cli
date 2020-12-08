module Year2020
  class Day07
    def initialize
      @bag_types_validity = {}
    end

    def part1(input)
      h = parse_input(input)
      valid = 0
      h.keys.each { |bag_type| valid += 1 if bag_type_valid?(bag_type, h) }
      valid
    end

    def part2(input)
      h = parse_input(input)
      count_bags('shiny gold', h)
    end

    def parse_input(input)
      rules = input.split("\n")
      h = {}
      rules.each do |rule|
        bag_type, contains = rule.match(/^(.+) bags contain (.+).$/).captures
        if contains != 'no other bags'
          contents = contains.split(", ")
          contents_hash = {}
          contents.each do |content|
            m = content.match(/^(\d)+ (.+) bags?$/)
            contents_hash[m[2]] = m[1].to_i
          end
          h[bag_type] = contents_hash
        else
          h[bag_type] = {}
        end
      end
      h
    end

    def bag_type_valid?(bag_type, h)
      return @bag_types_validity[bag_type] if @bag_types_validity.key?(bag_type)

      valid = false
      h[bag_type].keys.each do |content|
        if content == 'shiny gold'
          valid = true
        else
          valid ||= bag_type_valid?(content, h)
        end
      end
      @bag_types_validity[bag_type] = valid
    end

    def count_bags(bag_type, h)
      sum = 0
      h[bag_type].each do |content, count|
        sum += count + count * count_bags(content, h)
      end
      sum
    end
  end
end
