require_relative '../src/transaction'
require_relative '../src/account'

describe Transaction do
  let(:account) { Account.new }
  let(:statement) { Statement.new }

  it 'takes a deposit' do
    account.deposit(100)
    expect(account.balance).to eq 100
  end

  it 'gives a withdrawal' do
    account.deposit(1000)
    account.withdraw(100)
    expect(account.balance).to eq 900
  end
end
