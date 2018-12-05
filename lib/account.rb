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
    transaction = Transaction.new(amount, @balance)
    @balance = transaction.balance
    @statement.new_row(
      [Time.now.strftime('%H:%M, %e %^b %Y'), amount, 0, @balance]
    )
  end

  def withdraw(amount)
    if @balance >= amount
      transaction = Transaction.new(-amount, @balance)
      @balance = transaction.balance
      @statement.new_row(
        [Time.now.strftime('%H:%M, %e %^b %Y'), 0, amount, @balance]
      )
    else
      insufficient_funds
    end
  end

  def print_statement
    @statement.display
  end

  private

  def insufficient_funds
    raise 'Insufficient funds!'
  end
end