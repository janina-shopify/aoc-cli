require 'spec_helper'

RSpec.describe Year2020::Day11 do
  it "gets adjacent occupied" do
    input = <<-INPUT
#.##.##.##
#######.##
#.#.#..#..
####.##.##
#.##.##.##
#.#####.##
..#.#.....
##########
#.######.#
#.#####.##
    INPUT
    seating = input.split("\n").map {|row| row.split("")}
    d = Year2020::Day11.new
    expect(d.num_adjacent_occupied(0, 0, seating)).to eq(2)
  end

  it "gets num seat in view occupied" do
    input = <<-INPUT
.......#.
...#.....
.#.......
.........
..#L....#
....#....
.........
#........
...#.....
    INPUT
    seating = input.split("\n").map {|row| row.split("")}
    d = Year2020::Day11.new

    input2 = <<-INPUT2
.............
.L.L.#.#.#.#.
.............
    INPUT2
    seating2 = input2.split("\n").map {|row| row.split("")}
    expect(d.num_seat_in_view_occupied(1, 1, seating2)).to eq(1)

    input3 = <<-INPUT3
.##.##.
#.#.#.#
##...##
...L...
##...##
#.#.#.#
.##.##.
    INPUT3
    seating3 = input3.split("\n").map {|row| row.split("")}
    expect(d.num_seat_in_view_occupied(3, 3, seating3)).to eq(0)
  end

  it "gets seat in direction occupied" do
    input = <<-INPUT
.......#.
...#.....
.#.......
.........
..#L....#
....#....
.........
#........
...#.....
    INPUT
    seating = input.split("\n").map {|row| row.split("")}
    d = Year2020::Day11.new
    dirs = %w(W NW N NE E SE S SW)
    dirs.each do |dir|
      puts dir
      expect(d.seat_in_direction_occupied?(dir, 4, 3, seating)).to eq(true)
    end

  end
  # it "solves part1" do
  #   d = Year2020::Day11.new
  #   expect(d.part1('some_input')).to eq('expected_result')
  # end
  #
  # it "solves part2" do
  #   d = Year2020::Day11.new
  #   expect(d.part2('some_input')).to eq(nil)
  # end
end
