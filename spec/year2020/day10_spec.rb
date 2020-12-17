require 'spec_helper'

RSpec.describe Year2020::Day do
  it "solves part1" do
    d = Year2020::Day.new
    expect(d.part1('some_input')).to eq('expected_result')
  end

  it "solves part2" do
    d = Year2020::Day.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
