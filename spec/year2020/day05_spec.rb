require 'spec_helper'

RSpec.describe Year2020::Day05 do
  it "returns correct row for instructions" do
    d = Year2020::Day05.new
    instructions = %w(BFFFBBFRRR FFFBBBFRRR BBFFBBFRLL)
    rows = [70, 14, 102]
    instructions.each_with_index do |instr, index|
      expect(d.row(instr)).to eq(rows[index])
    end
  end

  it "returns correct column for instructions" do
    d = Year2020::Day05.new
    instructions = %w(BFFFBBFRRR FFFBBBFRRR BBFFBBFRLL)
    columns = [7, 7, 4]
    instructions.each_with_index do |instr, index|
      expect(d.column(instr)).to eq(columns[index])
    end
  end

  it "returns correct seat_id for instructions" do
    d = Year2020::Day05.new
    instructions = %w(BFFFBBFRRR FFFBBBFRRR BBFFBBFRLL)
    seat_ids = [567, 119, 820]
    instructions.each_with_index do |instr, index|
      expect(d.seat_id(instr)).to eq(seat_ids[index])
    end
  end

  it "solves part2" do
    d = Year2020::Day05.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
