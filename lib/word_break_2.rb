# frozen_string_literal: true

require 'set'

# Interpolate a string with spaces to form sentences according to a dictionary.
# https://leetcode.com/problems/word-break-ii/
class WordBreak2
  def word_break(original_str, dict)
    dictionary = Set.new
    dict.each { |entry| dictionary << entry.downcase }

    result_accumulator = []
    find_words(dictionary, original_str, 0, '', result_accumulator)
    result_accumulator
  end

  private

  # rubocop:disable Metrics/MethodLength
  def find_words(dictionary, original_str, start_index, sentence_accumulator, accum)
    end_index = start_index
    while end_index <= original_str.size
      new_word = original_str[start_index, end_index - start_index].downcase
      is_word = dictionary.include?(new_word)

      if is_word && end_index >= original_str.size
        accum << increase_sentence_accumulator(sentence_accumulator, new_word)
      elsif is_word
        find_words(dictionary, original_str, end_index, increase_sentence_accumulator(sentence_accumulator, new_word),
                   accum)
      end

      end_index += 1
    end
  end
  # rubocop:enable Metrics/MethodLength

  def increase_sentence_accumulator(sentence_accumulator, new_word)
    spacer = sentence_accumulator.empty? ? '' : ' '
    "#{sentence_accumulator}#{spacer}#{new_word}"
  end
end

# # Interpolate a string with spaces to form sentences according to a dictionary.
# # https://leetcode.com/problems/word-break-ii/
# class WordBreak2
#   def word_break(original_str, dict)
#     dictionary = Set.new
#     dict.each { |entry| dict << entry.downcase }

#     result_accumulator = []
#     find_words(dictionary, original_str, 0, '', result_accumulator)
#     result_accumulator
#   end

#   private

#   def find_words(dictionary, original_str, start_index, sentence_accumulator, result_accumulator)
#     i = start_index
#     while i <= original_str.size
#       new_word = str[start_index, i - start_index].downcase
#       is_word = dictionary.include?(new_word)

#       if is_word && i >= original_str.size
#         sentence_accumulator << increase_sentence_accumulator(sentence_accumulator, new_word)
#       elsif is_word
#         find_words(dictionary, original_str, i, increase_sentence_accumulator(sentence_accumulator, new_word),
#                    result_accumulator)
#       end

#       i += 1
#     end
#   end

# end
