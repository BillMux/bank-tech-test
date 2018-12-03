require 'terminal-table'
require 'time'

class Account
  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @rows = []
    @head = ['Date', 'In', 'Out', 'Balance']
    @statement = Terminal::Table.new :headings => @head, :rows => @rows
  end

  def deposit(amount)
    @balance += amount
    @rows << [Time.now, amount, 0, @balance]
  end

  def withdraw(amount)
    @balance -= amount
  end

  def print_statement
    puts @statement
  end

end
