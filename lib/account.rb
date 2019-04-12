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
  end

  def withdraw(amount)
    @balance >= amount ? transact(-amount) : insufficient_funds
  end

  def print_statement
    @statement.display
  end

  private

  def transact(money)
    transaction = Transaction.new(money, @balance)
    @balance = transaction.balance
    money.negative? ? statement_add_row(0, -money) : statement_add_row(money, 0)
  end

  def statement_add_row(money_in, money_out)
    @statement.new_row(
      [Time.now.strftime('%H:%M, %e %^b %Y'), money_in, money_out, @balance]
    )
  end

  def insufficient_funds
    raise 'Insufficient funds!'
  end
end
