require './lib/statement'

describe Statement do

  it "is able to print the header and ledger" do
    line1 = "date || credit || debit || balance\n"
    line2 = ("20/01/2001" + " ||  || 250 || 750\n")
    line3 = ("20/01/2001" + " || 1000 ||  || 1000\n")
    subject = Statement.new([["20/01/2001", 1000, "", 1000]], [["20/01/2001", "", 250, 750]])
    expect { subject.print }.to output(line1 + line2 + line3).to_stdout
  end

end
