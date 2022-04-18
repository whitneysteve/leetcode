# frozen_string_literal: true

# A class for make sure all as come before bs.
# https://leetcode.com/problems/check-if-all-as-appears-before-all-bs/
class AllAsBeforeBs
  def check_string(str)
    has_b = false
    str.chars.each do |char|
      is_b = char == 'b'
      is_a = char == 'a'
      return false if is_a && has_b
      has_b = has_b || is_b
    end
    true
  end
end
