require_relative 'statement'
require_relative 'transaction'
require 'terminal-table'
require 'time'

class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def deposit(amount)
    @balance += amount
    transaction = Transaction.new(amount, @balance)
    transaction.update_balance
    @statement.new_row([Time.now.strftime('%H:%M, %e %^b %Y'), amount, 0, @balance])
  end

  def withdraw(amount)
    @balance -= amount
    transaction = Transaction.new(-amount, @balance)
    transaction.update_balance
    @statement.new_row([Time.now.strftime('%H:%M, %e %^b %Y'), 0, amount, @balance])
  end

  def print_statement
    @statement.display
  end
end
