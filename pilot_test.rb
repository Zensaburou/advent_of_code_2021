# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'pilot.rb'

class TestPilot < MiniTest::Unit::TestCase
  def test_run
    input = "forward 1\ndown 2\nforward 1\nup 1\nforward 3"

    end_position = {
      horizontal: 5,
      depth: 5,
      aim: 1
    }

    assert_equal(Pilot.run(input), end_position)
  end

  def test_move_forward
    command = 'forward 2'

    start_position = {
      horizontal: 0,
      depth: 0,
      aim: 0
    }

    end_position = {
      horizontal: 2,
      depth: 0,
      aim: 0
    }

    assert_equal(Pilot._move(start_position, command), end_position)
  end

  def test_move_forward_with_aim
    command = 'forward 2'

    start_position = {
      horizontal: 0,
      depth: 0,
      aim: 3
    }

    end_position = {
      horizontal: 2,
      depth: 6,
      aim: 3
    }

    assert_equal(Pilot._move(start_position, command), end_position)
  end

  def test_move_forward_with_negative_aim
    command = 'forward 2'

    start_position = {
      horizontal: 0,
      depth: 5,
      aim: -1
    }

    end_position = {
      horizontal: 2,
      depth: 3,
      aim: -1
    }

    assert_equal(Pilot._move(start_position, command), end_position)
  end

  def test_move_down
    command = 'down 1'
    start_position = {
      horizontal: 0,
      depth: 0,
      aim: 0
    }

    end_position = {
      horizontal: 0,
      depth: 0,
      aim: 1
    }

    assert_equal(Pilot._move(start_position, command), end_position)
  end

  def test_move_up
    command = 'up 1'
    start_position = {
      horizontal: 0,
      depth: 0,
      aim: 1
    }

    end_position = {
      horizontal: 0,
      depth: 0,
      aim: 0
    }

    assert_equal(Pilot._move(start_position, command), end_position)
  end
end
