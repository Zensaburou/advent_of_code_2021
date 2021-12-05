# frozen_string_literal: true

class Pilot
  class << self
    def run(input)
      parsed_input = input.split("\n")
      parsed_movements = parsed_input.map { |input| _parse_movement(input) }
      _aggregate_movements(parsed_movements)
    end

    def _parse_movement(command)
      commands = command.split(' ')
      distance = commands[1].to_i

      case commands[0]
      when 'forward'
        return [distance, 0]
      when 'down'
        return [0, distance]
      when 'up'
        return [0, -distance]
      end

      raise "Command #{commands[0]} not recognized!"
    end

    def _aggregate_movements(movements)
      forwards = movements.map { |movement| movement[0] }
      depths = movements.map { |movement| movement[1] }

      [
        forwards.reduce(:+),
        depths.reduce(:+)
      ]
    end
  end
end
