require 'spec_helper'

RSpec.describe Year2020::Day12 do
  it "moves the ship to the waypoint" do
    ferry = Year2020::Ferry.new(waypoint: Year2020::Waypoint.new)
    ferry.move_to_waypoint(10)
    expect(ferry.pos).to eq([100, 10])
  end

  it "rotates the waypoint" do
    w = Year2020::Waypoint.new
    w.relative_pos = [10, 4]
    w.rotate(:R, 90)
    expect(w.relative_pos).to eq([4, -10])
  end
  #
  # [10, 4] -> [4, -10]
  #
  # it "solves part1" do
  #   d = Year2020::Day12.new
  #   expect(d.part1('some_input')).to eq('expected_result')
  # end
  #
  # it "solves part2" do
  #   d = Year2020::Day12.new
  #   expect(d.part2('some_input')).to eq(nil)
  # end
end
