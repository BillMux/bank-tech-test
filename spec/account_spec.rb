require_relative '../src/account.rb'

describe Account do

  it 'starts with a balance of zero' do
    expect(subject.balance).to eq 0
  end

  it 'takes a deposit' do
    subject.deposit(100)
    expect(subject.balance).to eq 100
  end

  it 'gives a withdrawal' do
    subject.deposit(1000)
    subject.withdraw(100)
    expect(subject.balance).to eq 900
  end

end