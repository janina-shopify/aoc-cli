module Year2020
  class Day08
    def part1(input)
      visited_hash = Hash.new(0)
      instructions = input.split("\n")
      current_instr = 0
      acc = 0

      while visited_hash[current_instr] == 0
        visited_hash[current_instr] += 1
        command, num = parse_instr(instructions[current_instr])

        case command
        when 'acc'
          acc += num
          current_instr += 1
        when 'jmp'
          current_instr += num
        when 'nop'
          current_instr += 1
        end
      end
      acc
    end

    def part2(input)
      instructions = input.split("\n")

      (0..instructions.size-1).each do |i|
        if instructions[i].include? "nop"
          instructions_copy = instructions.dup
          instructions_copy[i] = instructions_copy[i].gsub(/nop/, 'jmp')
          success = traverse_instructions_without_looping?(instructions_copy)
        elsif instructions[i].include? "jmp"
          instructions_copy = instructions.dup
          instructions_copy[i] = instructions_copy[i].gsub(/jmp/, 'nop')
          success = traverse_instructions_without_looping?(instructions_copy)
        end
        return success if success
      end
    end

    def traverse_instructions_without_looping?(instructions)
      visited_hash = Hash.new(0)

      num_instructions = instructions.size
      current_instr = 0
      acc = 0

      terminates = false
      while (not terminates) and visited_hash[current_instr] == 0
        visited_hash[current_instr] += 1
        command, num = parse_instr(instructions[current_instr])

        case command
        when 'acc'
          acc += num
          current_instr += 1
        when 'jmp'
          current_instr += num
        when 'nop'
          current_instr += 1
        end
        terminates = true if current_instr >= num_instructions
      end
      terminates ? acc : false
    end

    def parse_instr(instruction)
      command, num = instruction.split(" ")
      return command, num.to_i
    end

  end
end
