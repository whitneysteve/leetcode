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
      if str[i] == '('
        stack.push(i)
      else
        stack.pop
        if stack.empty?
          stack.push(i)
        else
          len = i - stack[-1]
          max = len if len > max
        end
      end
    end
    max
  end
end
