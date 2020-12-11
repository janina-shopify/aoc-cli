require 'spec_helper'

RSpec.describe Year2020::Day09 do
  it "valid? is valid" do
    d = Year2020::Day09.new
    input = (1..25).to_a
    expect(d.valid?(26, input)).to eq(true)
    expect(d.valid?(49, input)).to eq(true)
    expect(d.valid?(100, input)).to eq(false)
    expect(d.valid?(50, input)).to eq(false)
  end
end
