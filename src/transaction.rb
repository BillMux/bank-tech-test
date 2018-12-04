require_relative 'account'
require 'time'

class Transaction

  def initialize(amount, balance)
    @amount = amount
    @balance = balance
  end

  def update_balance
    @balance += @amount
  end
end
