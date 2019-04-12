require_relative '../lib/transaction'

describe Transaction do
  let(:deposit) { described_class.new(100, 0) }
  let(:withdraw) { described_class.new(-100, 1000) }

  it 'returns amount to account after desposit' do
    expect(deposit.balance).to eq 100
  end

  it 'returns amount to account after withdraw' do
    expect(withdraw.balance).to eq 900
  end
end
