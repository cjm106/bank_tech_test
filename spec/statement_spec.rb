require './lib/statement'

describe Statement do

  it "is able to return a statement header  " do
    subject = Statement.new([], [])
    expect { subject.header }.to output("date || credit || debit || balance\n").to_stdout
  end

  it "is able to return desposits in the format: 'date || credit ||  || balance' " do
    subject = Statement.new([["20/01/2001", 1000, "", 1000]], [])
    expect { subject.ledger }.to output("20/01/2001 || 1000 ||  || 1000\n").to_stdout
  end

  it "is able to return withdrawals in the format: 'date ||  || withdrawal || balance' " do
    subject = Statement.new([], [["20/01/2001", "", 1000, -1000]])
    expect { subject.ledger }.to output("20/01/2001 ||  || 1000 || -1000\n").to_stdout
  end

  it "is able to return deposits and withdrawals in the expected format: 'date || deposit || withdrawal || balance' " do
    subject = Statement.new([["20/01/2001", 1000, "", 1000]], [["20/01/2001", "", 1000, -1000]])
    expect { subject.ledger }.to output("20/01/2001 ||  || 1000 || -1000\n20/01/2001 || 1000 ||  || 1000\n").to_stdout
  end

end
