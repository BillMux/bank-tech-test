require_relative 'account'
require 'time'

class Transaction
  attr_reader :amount, :balance

  def initialize(amount, balance)
    @amount = amount
    @balance = balance + amount
  end
end
