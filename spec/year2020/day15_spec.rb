require 'spec_helper'

RSpec.describe Year2020::Day15 do
  it "solves part1" do
    d = Year2020::Day15.new
    expect(d.part1("1,3,2")).to eq(1)
    expect(d.part1("2,1,3")).to eq(10)
    expect(d.part1("1,2,3")).to eq(27)
    expect(d.part1("2,3,1")).to eq(78)
    expect(d.part1("3,2,1")).to eq(438)
    expect(d.part1("3,1,2")).to eq(1836)
  end

  # it "solves part2" do
  #   d = Year2020::Day15.new
  #   expect(d.part2('some_input')).to eq(nil)
  # end
end
