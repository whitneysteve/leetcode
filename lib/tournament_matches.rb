# frozen_string_literal: true

require 'set'

# Determine the number of matches in a tournament.
# https://leetcode.com/problems/count-of-matches-in-tournament/
class TournamentMatches
  def number_of_matches(num_teams)
    return 1 if num_teams == 2
    return 0 if num_teams < 2

    matches_this_round = (num_teams / 2).floor

    if num_teams.even?
      matches_this_round + number_of_matches(matches_this_round)
    else
      matches_this_round + number_of_matches(matches_this_round + 1)
    end
  end
end
