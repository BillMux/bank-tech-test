require_relative '../lib/account'

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

  it 'cannot withdraw more than remaining balance' do
    subject.deposit(500)
    expect { subject.withdraw(600) }.to raise_error('Insufficient funds!')
  end

  it 'can print a full bank statement' do
    subject.deposit(500)
    subject.withdraw(50)
    time = Time.now.strftime('%H:%M, %e %^b %Y')
    expect { subject.print_statement }.to output(
      "+--------------------+-----+-----+---------+
| Date               | In  | Out | Balance |
+--------------------+-----+-----+---------+
| #{time} | 500 | 0   | 500     |
| #{time} | 0   | 50  | 450     |
+--------------------+-----+-----+---------+"
    ).to_stdout
  end
end
