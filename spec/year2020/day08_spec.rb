require 'spec_helper'

RSpec.describe Year2020::Day08 do
  # it "solves part1" do
  #   d = Year2020::Day08.new
  #   expect(d.part1('some_input')).to eq('expected_result')
  # end

  it "solves part2" do
    input = <<-INPUT
nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
    INPUT
    d = Year2020::Day08.new
    expect(d.part2(input)).to eq(8)
  end
end
