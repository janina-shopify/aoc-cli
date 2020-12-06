require 'spec_helper'

input = <<-INPUT
abc

a
b
c

ab
ac

a
a
a
a

b
INPUT

RSpec.describe Year2020::Day06 do
  it "solves part1" do
    d = Year2020::Day06.new
    expect(d.part1(input)).to eq(11)
  end

  it "solves part2" do
    d = Year2020::Day06.new
    expect(d.part2(input)).to eq(6)
  end
end
