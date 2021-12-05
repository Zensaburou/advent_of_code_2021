# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'sonar.rb'

class TestSonar < MiniTest::Unit::TestCase
  def test_sonar
    input = "1\n2\n1\n3\n1\n2"
    assert_equal(Sonar.read(input), 2)
  end

  def test_parse_input
    input = "1\n2"
    assert_equal(Sonar._parse_input(input), [1, 2])
  end

  def test_count_increases
    input = [nil, 2, 1, 1, 3, 1, nil]
    assert_equal(Sonar._count_increases(input), 1)
  end

  def test_sliding_sum
    input = [1, 2, 1, 3, 1, 1]
    assert_equal(Sonar._sliding_sum(input, 1), 4)
  end

  def test_calculate_sums
    input = [1, 2, 1, 3, 1, 2]
    expected_result = [nil, 4, 6, 5, 6, nil]

    assert_equal(Sonar._calculate_sums(input), expected_result)
  end
end
