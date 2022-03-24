# frozen_string_literal: true

require 'set'

# https://leetcode.com/problems/check-if-every-row-and-column-contains-all-numbers/
class MatrixContainsAllNumbers
  def check_valid(matrix)
    n = matrix.size
    expected = Set.new(n.times.map { |i| i + 1 })
    col_results = n.times.map { |_| expected.dup }

    matrix.each_with_index do |row, _y|
      return false if !check_row(expected, col_results, row)
    end

    col_results.none? { |col_result| !col_result.empty? }
  end

  private

  def check_row(expected, col_results, row)
    row_result = expected.dup

    row.each_with_index do |value, x|
      return false if !check_value(row_result, value)
      return false if !check_value(col_results[x], value)
    end

    true
  end

  def check_value(result, value)
    if result.include? value
      result.delete(value)
      true
    else
      false
    end
  end
end
