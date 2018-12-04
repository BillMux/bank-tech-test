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

  describe 'statement' do
    it 'is a table containing headers' do
      expect(subject.head[0]).to eq 'Date'
      expect(subject.head[1]).to eq 'In'
      expect(subject.head[2]).to eq 'Out'
      expect(subject.head[3]).to eq 'Balance'
    end
  end
end
