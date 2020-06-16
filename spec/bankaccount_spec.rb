require './lib/bankaccount'

describe BankAccount do

  before(:each) do
    @subject = BankAccount.new
    @current_date = Time.now.strftime("%d/%m/%Y")
  end

  it "is able to accept deposits" do
    @subject.add(1000)
    expect(@subject.deposits).to eq([[@current_date, 1000, "", 1000]])
  end

  it "is able to accept withdrawal requests" do
    @subject.remove(500)
    expect(@subject.withdrawals).to eq([[@current_date, "", 500, -500]])
  end

  it "is able to add a deposit to the account balance" do
    @subject.add(1000)
    @subject.add(500)
    expect(@subject.balance).to eq(1500)
  end

  it "is able to subtract a withdrawal from the account balance" do
    @subject.add(1000)
    @subject.remove(250)
    expect(@subject.balance).to eq(750)
  end

  it "is able to print a statement" do
    line1 = "date || credit || debit || balance\n"
    line2 = (@current_date + " ||  || 250 || 750\n")
    line3 = (@current_date + " || 1000 ||  || 1000\n")
    @subject.add(1000)
    @subject.remove(250)
    expect { @subject.print_statement }.to output(line1 + line2 + line3).to_stdout
  end

end
