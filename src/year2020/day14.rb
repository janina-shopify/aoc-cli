module Year2020
  class Day14
    def part1(input)
      memory = Hash.new(0)
      instructions = input.split("\n")
      mask = ""

      instructions.each do |instr|
        if instr.start_with?("mask")
          m = instr.match(/^mask = ([X10]+)$/)
          mask = m[1]
        elsif instr.start_with?("mem")
          m = instr.match(/^mem\[(\d+)\] = (\d+)$/)
          address = m[1].to_i
          value = m[2].to_i

          memory[address] = mask_value(mask, value)
        end
      end
      memory.values.reduce(:+)
    end

    def part2(input)
      memory = Hash.new(0)
      instructions = input.split("\n")
      mask = ""

      instructions.each do |instr|
        if instr.start_with?("mask")
          m = instr.match(/^mask = ([X10]+)$/)
          mask = m[1]
        elsif instr.start_with?("mem")
          m = instr.match(/^mem\[(\d+)\] = (\d+)$/)
          address = m[1].to_i
          value = m[2].to_i

          address = mask_address(mask, address)
          addresses = get_addresses(address)

          addresses.each do |address|
            memory[address] = value
          end
        end
      end
      memory.values.reduce(:+)
    end

    # PART 2 #

    def to_binary_string(val, padding: 36)
      val.to_s(2).rjust(padding, "0")
    end

    def mask_address(mask, address)
      bin_address = to_binary_string(address)

      (0..35).each do |i|
        if mask[i] == "0"
          # do nothing
        elsif mask[i] == "1"
          bin_address[i] = "1"
        elsif mask[i] == "X"
          bin_address[i] = "X"
        end
      end
      bin_address
    end

    def get_addresses(address)
      address = address.split("")
      addresses = []
      num_xs = address.count("X")
      num_addresses = 2 ** num_xs

      (0..num_addresses-1).each do |i|
        j = 0
        new_address = address.clone
        mask_bits = to_binary_string(i, padding: num_xs)
        address.each_with_index do |bit, address_index|
          if bit == "X"
            new_address[address_index] = mask_bits[j]
            j += 1
          end
        end
        addresses.append(new_address)
      end
      addresses.map! do |address|
        address.join.to_i(2)
      end

      addresses
    end

    # PART 1 #

    def mask_value(mask, val)
      # Flip 1s, use bitwise OR
      one_mask = mask_to_1(mask)
      # Flip 0s, use bitwise AND
      zero_mask = mask_to_0(mask)

      (val | one_mask) & zero_mask
    end

    def mask_to_1(mask)
      mask.gsub("X","0").to_i(2)
    end

    def mask_to_0(mask)
      mask.gsub("X","1").to_i(2)
    end
  end
end
