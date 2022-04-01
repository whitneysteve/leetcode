# frozen_string_literal: true

# Calculate the number of ferris wheel rotations for maximum profit.
# https://leetcode.com/problems/maximum-profit-of-operating-a-centennial-wheel/
class FerrisWheelMaxProfit
  def min_operations_max_profit(customers, boarding_cost, running_cost)
    wheel = FerrisWheel.new(boarding_cost, running_cost)
    wheel.simulate(customers)
    wheel.most_profitable_num_turns
  end
end

# Class to pull the copious state out of the thread safe method in FerrisWheelMaxProfit.
class FerrisWheel
  def initialize(boarding_cost, running_cost)
    @boarding_cost = boarding_cost
    @running_cost = running_cost

    @queue_size = 0
    @costs = 0
    @sales = 0

    @max_profit = -1
    @most_profitable_num_turns = 0
  end

  def most_profitable_num_turns
    @most_profitable_num_turns.zero? ? -1 : @most_profitable_num_turns
  end

  def simulate(customers)
    process_customers(customers)
    process_queue(customers)
  end

  private

  def process_customers(customers)
    customers.each_with_index do |num_customers, i|
      queue(num_customers)
      rotate(i)
    end
  end

  def process_queue(customers)
    i = customers.size
    while @queue_size.positive?
      rotate(i)
      i += 1
    end
  end

  def queue(num_customers)
    @queue_size += num_customers
  end

  def rotate(idx)
    boarding = dequeue
    profit = calculate_profit(boarding)
    save_max_profit(profit, idx + 1)
  end

  def dequeue
    if @queue_size > 4
      @queue_size -= 4
      4
    else
      boarding = @queue_size
      @queue_size = 0
      boarding
    end
  end

  def calculate_profit(boarding)
    @sales += boarding * @boarding_cost
    @costs += @running_cost
    @sales - @costs
  end

  def save_max_profit(profit, turn)
    return if profit <= 0 || profit <= @max_profit

    @max_profit = profit

    @most_profitable_num_turns = turn
  end
end
