# frozen_string_literal: true

class Pilot
  class << self
    def run(input)
      position = {
        horizontal: 0,
        depth: 0,
        aim: 0
      }

      parsed_input = input.split("\n")

      parsed_input.each do |input|
        position = _move(position, input)
      end

      position
    end

    def _move(position, command)
      command = command.split(' ')
      direction = command[0]
      magnitude = command[1].to_i

      case direction
      when 'forward'
        position[:horizontal] = position[:horizontal] + magnitude
        position[:depth] = position[:depth] + (position[:aim] * magnitude)
      when 'down'
        position[:aim] = position[:aim] + magnitude
      when 'up'
        position[:aim] = position[:aim] - magnitude
      end

      position
    end
  end
end
