class Account
  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = ['Date', 'In', 'Out', 'Balance']
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

end
