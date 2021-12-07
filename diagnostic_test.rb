# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'diagnostic.rb'

class TestDiagnostic < MiniTest::Unit::TestCase
  def test_gamma_rate
    input = "1100\n1010\n0011"

    result = Diagnostic._gamma_rate(input)
    assert_equal('1010', result)
  end

  def test_epsilon_rate
    input = "1100\n1010\n0011"

    result = Diagnostic._epsilon_rate(input)
    assert_equal('101', result)
  end

  def test_mask
    result = Diagnostic._mask('11'.to_i(2))
    assert_equal('01'.to_i(2), result)
  end

  def test_most_common
    readings = [
      '01'.to_i(2),
      '01'.to_i(2),
      '00'.to_i(2)
    ]

    result = Diagnostic._most_common(readings)
    assert_equal('1', result)
  end

  def test_most_common_zero
    readings = [
      '00'.to_i(2),
      '01'.to_i(2),
      '00'.to_i(2)
    ]

    result = Diagnostic._most_common(readings)
    assert_equal('0', result)
  end
end
