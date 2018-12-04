require_relative '../src/statement'


describe Statement do
  it 'is a table containing headers' do
    expect(subject.header[0]).to eq 'Date'
    expect(subject.header[1]).to eq 'In'
    expect(subject.header[2]).to eq 'Out'
    expect(subject.header[3]).to eq 'Balance'
  end
  # test stdout after transactions
end
