require 'pp'
module Year2020
  class Day04
    def part1(input)
      required = %w(byr ecl eyr hcl hgt iyr pid)
      passports = input.split("\n\n")

      passports.inject(0) do |valid, passport_raw|
        passport_raw.split(/\s/).map do |entry|
          entry.split(":")[0]
        end.sort.reject{|key| key == 'cid'} == required ? valid + 1: valid
      end

    end

    def part2(input)
      required = %w(byr ecl eyr hcl hgt iyr pid)
      passports = input.split("\n\n")

      v = Validator.new

      passports.inject(0) do |num_valid, passport_raw|
        valid = true
        h = {}
        passport_raw.split(/\s/).each do |entry|
          key, val = entry.split(":")
          h[key] = val if key != 'cid'
        end

        valid = false if h.keys.sort != required

        h.each do |key, value|
          if not v.send(key, value)
            valid = false
            break
          end
        end

        valid ? num_valid + 1 : num_valid
      end
    end
  end

  class Validator
    def byr(byr)
      if byr.match(/^\d{4}$/)
        byr = byr.to_i
        byr <= 2002 and byr >= 1920
      end
    end

    def iyr(iyr)
      if iyr.match(/^\d{4}$/)
        iyr = iyr.to_i
        iyr <= 2020 and iyr >= 2010
      end
    end

    def eyr(eyr)
      if eyr.match(/^\d{4}$/)
        eyr = eyr.to_i
        eyr <= 2030 and eyr >= 2020
      end
    end

    def hgt(hgt)
      height = hgt.match(/^(\d+)(cm|in)$/)
      if height
        height_val = height[1].to_i
        if height[2] == 'cm'
          height_val <= 193 and height_val >= 150
        elsif height[2] == 'in'
          height_val <= 76 and height_val >= 59
        end
      end
    end

    def hcl(hcl)
      hcl.match(/^#[0-9a-f]{6}$/)
    end

    def ecl(ecl)
      %w(amb blu brn gry grn hzl oth).include?(ecl)
    end

    def pid(pid)
      pid.match(/^\d{9}$/)
    end
  end
end
