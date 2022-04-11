# frozen_string_literal: true

# Class representing a rectangle
# https://leetcode.com/problems/subrectangle-queries/
class SubrectangleQueries
  def initialize(rectangle)
    raise 'InvalidRectangle' if !rectangle.is_a?(Array) || rectangle.empty?

    @rect = rectangle
    @rows = rectangle.size
    @cols = rectangle[0].size

    @rect.each { |row| raise 'InvalidRectangle' if row.size != @cols }
  end

  def update_subrectangle(row1, col1, row2, col2, new_value)
    raise 'InvalidSubrectangle' if invalid_point?(row1, col1) || invalid_point?(row2, col2)

    (row1..row2).each do |i|
      (col1..col2).each do |j|
        @rect[i][j] = new_value
      end
    end
  end

  def get_value(row, col)
    return nil if invalid_point?(row, col)

    @rect[row][col]
  end

  def to_s
    s = ''
    @rect.each { |row| s = "#{s}\n#{row.join(',')}" }
    s
  end

  private

  def invalid_point?(row, col)
    row.negative? || col.negative? || row >= @rows || col >= @cols
  end
end
