require 'terminal-table'
require 'time'

class Account
  attr_reader :balance, :statement, :head, :statement, :rows

  def initialize
    @balance = 0
    @head = ['Date', 'In', 'Out', 'Balance']
    @statement = Terminal::Table.new :headings => @head
  end

  def deposit(amount)
    @balance += amount
    @statement.add_row [Time.now.strftime('%H:%M, %e %^b %Y'), amount, 0, @balance]
  end

  def withdraw(amount)
    @balance -= amount
    @statement.add_row [Time.now.strftime('%H:%M, %e %^b %Y'), 0, amount, @balance]
  end

  def print_statement
    puts @statement
  end

end
