require_relative '../src/account'
require_relative '../src/transaction'

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

  it 'cannot accept a string as transaction' do
    expect { subject.deposit('cheese') }.to raise_error(
      'Please try an integer.'
    )
    expect { subject.withdraw('cheese') }.to raise_error(
      'Please try an integer.'
    )
  end

  it 'cannot withdraw more than remaining balance' do
    subject.deposit(500)
    expect { subject.withdraw(600) }.to raise_error('Insufficient funds!')
  end
end
