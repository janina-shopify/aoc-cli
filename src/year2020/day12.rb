require 'pp'
require 'byebug'
require 'matrix'
module Year2020
  class Day12
    def part1(input)
      instructions = input.split("\n")
      ferry = Ferry.new

      instructions.each do |instr|
        action, value = parse_instruction(instr)
        if ferry.directions.keys.include?(action)
          ferry.move(action, value)
        elsif [:L, :R].include?(action)
          ferry.turn(action, value)
        elsif action == :F
          ferry.move(ferry.facing, value)
        end
      end

      ferry.manhattan_distance
    end

    def part2(input)
      instructions = input.split("\n")
      ferry = Ferry.new(waypoint: Waypoint.new)

      instructions.each do |instr|
        action, value = parse_instruction(instr)
        if ferry.directions.keys.include?(action)
          ferry.waypoint.move(action, value)
        elsif [:L, :R].include?(action)
          ferry.waypoint.rotate(action, value)
        elsif action == :F
          ferry.move_to_waypoint(value)
        end
      end

      ferry.manhattan_distance
    end

    def parse_instruction(instr)
      action, value = instr.match(/^([A-Z])(\d+)$/).captures
      return action.to_sym, value.to_i
    end
  end


  class Ferry
    attr_reader :facing, :directions, :waypoint, :pos
    def initialize(waypoint: nil)
      @directions = {
        W: [-1, 0],
        N: [0, 1],
        E: [1, 0],
        S: [0, -1]
      }
      @pos = [0,0]
      @facing = :E
      @waypoint = waypoint
    end

    def turn(direction, degrees)
      steps = direction(direction) * (degrees / 90)
      index = (@directions.keys.index(@facing) + steps) % 4
      @facing = @directions.keys[index]
    end

    def direction(direction)
      if direction == :L
        return -1
      elsif direction === :R
        return 1
      end
    end

    def move_to_waypoint(times)
      if @waypoint
        direc = @waypoint.relative_pos
        times.times do
          @pos = [@pos, direc].transpose.map(&:sum)
        end
      end
    end

    def move(dir, value)
      # e.g. pos [0,0] move 'W', [0-1, 0+0] => [-1, 0]
      direc = @directions[dir].map{|offset| offset * value}
      @pos = [@pos, direc].transpose.map(&:sum)
    end

    def manhattan_distance
      @pos[0].abs + @pos[1].abs
    end
  end

  class Waypoint
    attr_accessor :relative_pos
    def initialize
      @directions = {
        W: [-1, 0],
        N: [0, 1],
        E: [1, 0],
        S: [0, -1]
      }
      @relative_pos = [10, 1]
    end

    def move(dir, value)
      # e.g. pos [0,0] move 'W', [0-1, 0+0] => [-1, 0]
      direc = @directions[dir].map{|offset| offset * value}
      @relative_pos = [@relative_pos, direc].transpose.map(&:sum)
    end

    def rotate(direction, degrees)
      times = degrees / 90
      if direction == :L # counter-clockwise
        rotation_matrix = Matrix[[0, -1], [1, 0]]
      elsif direction == :R # clockwise
        rotation_matrix = Matrix[[0, 1], [-1, 0]]
      end

      relative_pos_matrix = Matrix[@relative_pos].transpose
      times.times { relative_pos_matrix = rotation_matrix * relative_pos_matrix }
      @relative_pos = relative_pos_matrix.transpose.to_a.flatten
    end
  end
end
