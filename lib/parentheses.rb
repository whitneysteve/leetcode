# frozen_string_literal: true

require 'set'

# A class for handling parentheses `(` and `)` in Strings.
# https://leetcode.com/problems/longest-valid-parentheses/
class Parentheses
  def longest_valid_parentheses(str)
    max = 0
    stack = []
    stack.push(-1)
    str.size.times.each do |i|
      len = check_max_len(str, i, stack, max)
      max = len if len > max
    end
    max
  end

  def check_max_len(str, idx, stack, _max)
    if str[idx] != '('
      stack.pop
      return idx - stack[-1] if !stack.empty?
    end
    stack.push(idx)
    -1
  end
end
