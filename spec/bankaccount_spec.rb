require './lib/bankaccount'

describe BankAccount do

  before(:each) do
    @subject = BankAccount.new
    @current_date = Time.now.strftime("%d/%m/%Y")
  end

  it "is able to accept deposits" do
    @subject.deposit(1000.00)
    expect(@subject.transactions.deposits).to eq([[@current_date, "1000.00", "", "1000.00"]])
  end

  it "is able to accept withdrawal requests" do
    @subject.withdraw(500.50)
    expect(@subject.transactions.withdrawals).to eq([[@current_date, "", "500.50", "-500.50"]])
  end

  it "is able to add a deposit to the account balance" do
    @subject.deposit(1000.00)
    @subject.deposit(500.00)
    expect(@subject.balance).to eq(1500)
  end

  it "is able to subtract a withdrawal from the account balance" do
    @subject.deposit(1000.00)
    @subject.withdraw(250.60)
    expect(@subject.balance).to eq(749.40)
  end

  it "is able to print a statement" do
    line1 = "date || credit || debit || balance\n"
    line2 = (@current_date + " ||  || 250.00 || 750.00\n")
    line3 = (@current_date + " || 1000.00 ||  || 1000.00\n")
    @subject.deposit(1000.00)
    @subject.withdraw(250.00)
    expect { @subject.print_statement }.to output(line1 + line2 + line3).to_stdout
  end

end
