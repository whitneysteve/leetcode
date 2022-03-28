# frozen_string_literal: true

require_relative '../lib/tournament_matches'
require 'minitest/autorun'

# Test for TournamentMatches.
class TournamentMatchesTest < Minitest::Test
  def test_number_of_matches
    matches = TournamentMatches.new
    assert_equal 6, matches.number_of_matches(7)
    assert_equal 13, matches.number_of_matches(14)

    (1..200).each { |n| matches.number_of_matches(n) }
  end
end
