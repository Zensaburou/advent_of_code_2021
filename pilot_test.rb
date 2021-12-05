# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'pilot.rb'

class TestPilot < MiniTest::Unit::TestCase
  def test_run
    input = "forward 1\ndown 2\nup 1"
    assert_equal(Pilot.run(input), [1, 1])
  end

  def test_parse_movement_forward
    command = 'forward 2'
    assert_equal(Pilot._parse_movement(command), [2, 0])
  end

  def test_parse_movement_down
    command = 'down 2'
    assert_equal(Pilot._parse_movement(command), [0, 2])
  end

  def test_parse_movement_up
    command = 'up 2'
    assert_equal(Pilot._parse_movement(command), [0, -2])
  end

  def test_aggregate_movements
    movements = [
      [0, 2],
      [2, 0],
      [1, -1]
    ]

    assert_equal(Pilot._aggregate_movements(movements), [3, 1])
  end
end
