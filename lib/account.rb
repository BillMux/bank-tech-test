require_relative 'statement'
require_relative 'transaction'
require 'time'

# account class
class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def deposit(amount)
    transact(amount)
    @statement.new_row(
      [Time.now.strftime('%H:%M, %e %^b %Y'), amount, 0, @balance]
    )
  end

  def withdraw(amount)
    if @balance >= amount
      transact(-amount)
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

  def transact(amount)
    transaction = Transaction.new(amount, @balance)
    @balance = transaction.balance
  end

  def insufficient_funds
    raise 'Insufficient funds!'
  end
end
