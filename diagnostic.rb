# frozen_string_literal: true

class Diagnostic
  class << self
    def power_consumption(report)
      _gamma_rate(report).to_i(2) * _epsilon_rate(report).to_i(2)
    end

    def _gamma_rate(report)
      readings = report.split("\n")
      binary_length = readings.first.length

      readings = readings.map { |reading| reading.to_i(2) }

      most_common = []

      binary_length.times do |i|
        # Shift and mask the binary strings to inspect only one "column" of the binaries at a time
        shifted_readings = readings.map { |reading| _mask(reading >> i) }
        # Find the most common bit, then prepend it to our output string
        most_common.unshift(_most_common(shifted_readings))
      end

      most_common.join
    end

    def _epsilon_rate(report)
      readings = report.split("\n")
      binary_length = readings.first.length
      mask = []
      binary_length.times { |_i| mask << '1' }
      mask = mask.join

      # Invert the bits from the gamma rate
      # The NOT (~) operator does not return the underlying bits, but the mathematical represenation of a number in a given base
      # We explicitly XOR the binary string instead
      gamma = _gamma_rate(report).to_i(2)
      (gamma ^ mask.to_i(2)).to_s(2)
    end

    def _mask(number)
      number & 0o001
    end

    def _most_common(readings)
      readings.sum > (readings.length / 2) ? '1' : '0'
    end
  end
end
