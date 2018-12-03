require_relative '../src/account.rb'

describe 'Account' do
  before :each do
    bank = Account.new
  end

  it 'takes a deposit' do
    bank.deposit(100)
    expect(bank.balance).to eq 100
  end
end
