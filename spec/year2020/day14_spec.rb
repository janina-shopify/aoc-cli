require 'spec_helper'

RSpec.describe Year2020::Day14 do
  it "masks the value" do
    d = Year2020::Day14.new
    mask = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X"
    expect(d.mask_value(mask, 11)).to eq(73)
    expect(d.mask_value(mask, 101)).to eq(101)
    expect(d.mask_value(mask, 0)).to eq(64)
  end

  it "gets the addresses" do
    d = Year2020::Day14.new
    s = "000000000000000000000000000000X1101X"
    expect(d.get_addresses(s)).to eq([26, 27, 58, 59])

    s = "00000000000000000000000000000001X0XX"
    expect(d.get_addresses(s)).to eq([16, 17, 18, 19, 24, 25, 26, 27])
  end
  # it "solves part1" do
  #   d = Year2020::Day14.new
  #   expect(d.part1('some_input')).to eq('expected_result')
  # end
  #
  # it "solves part2" do
  #   d = Year2020::Day14.new
  #   expect(d.part2('some_input')).to eq(nil)
  # end
end
