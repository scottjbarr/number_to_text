require 'test/test_helper'

class NumberTest < Test::Unit::TestCase

  def setup
    @number = Number.new(123456789)
  end

  def test_integer_at
    assert_equal 2, @number.integer_at(8)
  end
  
  def test_integer_in_group
    assert_equal 789, @number.integer_in_group(0)
    assert_equal 456, @number.integer_in_group(1)
  end
  
  def test_zero
    assert Number.new(0).zero?
    assert ! @number.zero?
  end

  def test_groups
    assert_equal 789, @number.hundreds
    assert_equal 456, @number.thousands
    assert_equal 123, @number.millions
  end

  def test_one
    n = Number.new(1)
    assert_equal 1, n.to_i
    assert_equal 1, n.hundreds
    assert_equal "one", n.to_word
  end
  
  def test_ten
    n = Number.new(10)
    assert_equal 10, n.to_i
    assert_equal 10, n.hundreds
    assert_equal "ten", n.to_word
  end
  
  def test_one_hundred
    n = Number.new(100)
    assert_equal 100, n.to_i
    assert_equal 100, n.hundreds
    assert_equal "one-hundred", n.to_word
  end
  
  def test_ninety_eight
    n = Number.new(98)
    assert_equal 98, n.to_i
    assert_equal 98, n.hundreds
    assert_equal "ninety-eight", n.to_word
  end

  def test_nine_hundred_and_eighty_seven
    n = Number.new(987)
    assert_equal 987, n.to_i
    assert_equal 987, n.hundreds
    assert_equal "nine-hundred-and-eighty-seven", n.to_word
  end
  
  def test_nineteen
    n = Number.new(19)
    assert_equal 19, n.to_i
    assert_equal 19, n.hundreds
    assert_equal "nineteen", n.to_word
  end
  
  def test_one_hundred_and_nineteen
    n = Number.new(119)
    assert_equal 119, n.to_i
    assert_equal 119, n.hundreds
    assert_equal "one-hundred-and-nineteen", n.to_word
  end
  
  def test_two_hundred_and_one
    n = Number.new(201)
    assert_equal 201, n.to_i
    assert_equal 201, n.hundreds
    assert_equal "two-hundred-and-one", n.to_word
  end
  
  def test_one_hundred_and_ninety
    n = Number.new(190)
    assert_equal 190, n.to_i
    assert_equal 190, n.hundreds
    assert_equal "one-hundred-and-ninety", n.to_word
  end

  def test_one_thousand
    n = Number.new(1000)
    assert_equal 1000, n.to_i
    assert_equal 1, n.thousands
    assert_equal 0, n.hundreds
    assert_equal "one-thousand", n.to_word
  end
  
  def test_one_thousand_and_one
    n = Number.new(1001)
    assert_equal 1001, n.to_i
    assert_equal 1, n.thousands
    assert_equal 1, n.hundreds
    assert_equal "one-thousand-and-one", n.to_word
  end
  
  def test_one_hundred_thousand_and_one
    n = Number.new(100001)
    assert_equal 100001, n.to_i
    assert_equal 100, n.thousands
    assert_equal 1, n.hundreds
    assert_equal "one-hundred-thousand-and-one", n.to_word
  end
  
  def test_one_million_and_one
    n = Number.new(1000001)
    assert_equal 1000001, n.to_i
    assert_equal 1, n.millions
    assert_equal 0, n.thousands
    assert_equal 1, n.hundreds
    assert_equal "one-million-and-one", n.to_word
  end
  
  def test_one_billion_and_one
    n = Number.new(1000000001)
    assert_equal 1000000001, n.to_i
    assert_equal 1, n.billions
    assert_equal 0, n.millions
    assert_equal 0, n.thousands
    assert_equal 1, n.hundreds
    assert_equal "one-billion-and-one", n.to_word
  end
  
  def test_one_trillion_and_one
    n = Number.new(1000000000001)
    assert_equal 1000000000001, n.to_i
    assert_equal 1, n.trillions
    assert_equal 0, n.billions
    assert_equal 0, n.millions
    assert_equal 0, n.thousands
    assert_equal 1, n.hundreds
    assert_equal "one-trillion-and-one", n.to_word
  end
  
end
