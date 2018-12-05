require_relative '../lib/statement'

describe Statement do
  it 'is a table containing headers' do
    expect(subject.header[0]).to eq 'Date'
    expect(subject.header[1]).to eq 'In'
    expect(subject.header[2]).to eq 'Out'
    expect(subject.header[3]).to eq 'Balance'
  end

  it 'can output to terminal' do
    expect { subject.display }.to output.to_stdout
  end

  it 'outputs table to terminal' do
    expect { subject.display }.to output(
      "+------+----+-----+---------+
| Date | In | Out | Balance |
+------+----+-----+---------+
+------+----+-----+---------+"
    ).to_stdout
  end

  it 'outputs table with transactions' do
    subject.new_row(['13:35,  5 DEC 2018', 1000, 0, 1000])
    expect { subject.display }.to output(
      "+--------------------+------+-----+---------+
| Date               | In   | Out | Balance |
+--------------------+------+-----+---------+
| 13:35,  5 DEC 2018 | 1000 | 0   | 1000    |
+--------------------+------+-----+---------+"
    ).to_stdout
  end
end
