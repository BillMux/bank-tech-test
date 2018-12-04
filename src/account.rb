require_relative 'statement'
require_relative 'transaction'
require 'time'

class Account # :nodoc:
  attr_reader :balance

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def deposit(amount)
    if amount.is_a? Integer
      transaction = Transaction.new(amount, @balance)
      @balance = transaction.balance
      @statement.new_row(
        [Time.now.strftime('%H:%M, %e %^b %Y'), amount, 0, @balance]
      )
    else
      string_error
    end
  end

  def withdraw(amount)
    if (amount.is_a? Integer) && @balance >= amount
      transaction = Transaction.new(-amount, @balance)
      @balance = transaction.balance
      @statement.new_row(
        [Time.now.strftime('%H:%M, %e %^b %Y'), 0, amount, @balance]
      )
    else
      (amount.is_a? Integer) ? insufficient_funds : string_error
    end
  end

  def print_statement
    @statement.display
  end

  private

  def insufficient_funds
    raise 'Insufficient funds!'
  end

  def string_error
    raise 'Please try an integer.'
  end
end
