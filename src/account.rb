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
    transaction = Transaction.new(amount, @balance)
    transaction.update_balance
    @statement.new_row([Time.now.strftime('%H:%M, %e %^b %Y'), amount, 0, @balance])
    @balance = transaction.balance
  end

  def withdraw(amount)
    transaction = Transaction.new(-amount, @balance)
    transaction.update_balance
    @statement.new_row([Time.now.strftime('%H:%M, %e %^b %Y'), 0, amount, @balance])
    @balance = transaction.balance
  end

  def print_statement
    @statement.display
  end
end
