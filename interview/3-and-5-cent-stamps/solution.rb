# https://coderpad.io/KYKPAX6T

require "rspec/autorun"
#require "minitest/autorun"

# Use shift+enter or ctrl+enter to run the code

# Create a function or class to find the most efficient combination 
# of 3¢ and 5¢ stamps required to make any postage of 8¢ or more. 

# Input/Output examples:

  # input: 8 
  # 1 five cent stamp, 1 three cent stamp

  # input: 11
  # 1 five cent stamp, 2 three cent stamps

  # input: 100
  # 20 five cent stamps, 0 three cent stamps

  # input: 10000002
  # 1999998 five cent stamps, 4 three cent stamps

# 5x + 3y = z
#z % 5 = 3 ->  8 = 3*1 + 5*1
#z % 5 = 4 ->  9 = 3*3
#
#z % 5 = 0 -> 10 = 5*2
#z % 5 = 1 -> 11 = 5*1 + 3*2
#z % 5 = 2 -> 12 = 3*4

def make_change(cents)
  case cents % 5
  when 0
    [cents / 5, 0]
  when 1
    [(cents / 5) - 1, 2]
  when 2
      [(cents / 5) - 2, 4]
  when 3
      [cents / 5, 1]
  when 4
      [(cents / 5) - 1, 3]
  end
end

describe 'make_change' do
  it 'makes correct change for 17 cents' do
    (fives, threes) = make_change(17)
    expect(fives).to eq(1)
    expect(threes).to eq(4)
  end
end
