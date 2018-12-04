require_relative '../src/transaction'

describe Transaction do
  let(:transaction_1) { Transaction.new(100, 0) }
  let(:transaction_2) { Transaction.new(-100, 1000) }

  describe 'after deposit' do
    it 'returns amount to account' do
      expect(transaction_1.balance).to eq 100
    end
  end

  describe 'after withdrawal' do
    it 'returns amount to account' do
      expect(transaction_2.balance).to eq 900
    end
  end
end
