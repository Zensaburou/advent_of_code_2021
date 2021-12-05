# frozen_string_literal: true

class Sonar
  class << self
    def read(input)
      parsed_input = _parse_input(input)
      sliding_sums = _calculate_sums(parsed_input)

      _count_increases(sliding_sums)
    end

    def _parse_input(input)
      readings = input.split("\n")
      readings.map { |reading| reading.to_i }
    end

    def _count_increases(sliding_sums)
      sliding_sums.compact!
      return 0 if sliding_sums.length < 2

      increases = 0

      lead_index = 1
      follow_index = 0

      while lead_index < sliding_sums.length
        increases += 1 if sliding_sums[lead_index] > sliding_sums[follow_index]

        lead_index += 1
        follow_index += 1
      end

      # The first sum is always counted as an "increase"
      increases
    end

    def _calculate_sums(input)
      input.each_with_index.map { |_reading, index| _sliding_sum(input, index) }
    end

    def _sliding_sum(input, index)
      return nil if index > input.length - 2
      return nil if index < 1

      input[index - 1] + input[index] + input[index + 1]
    end
  end
end
