require './lib/transactions'
require './lib/bankaccount'

describe Transactions do

  before(:each) do
    @subject = Transactions.new
    @current_date = Time.now.strftime("%d/%m/%Y")
  end

  it "is able to accept deposits" do
    transaction = [@current_date, "1000.00", "", "1000.00"]
    expect(@subject.money_in(transaction)).to eq([[@current_date, "1000.00", "", "1000.00"]])
  end

  it "is able to accept withdrawal requests" do
    transaction = [@current_date, "", "500.00", "-500.00"]
    expect(@subject.money_out(transaction)).to eq([[@current_date, "", "500.00", "-500.00"]])
  end

  it "is able to keep a record of all deposits" do
    transaction_1 = [@current_date, "1000.00", "", "1000.00"]
    transaction_2 = [@current_date, "10.50", "", "1010.50"]
    @subject.money_in(transaction_1)
    @subject.money_in(transaction_2)
    expect(@subject.deposits).to eq([[@current_date, "1000.00", "", "1000.00"], [@current_date, "10.50", "", "1010.50"]])
  end

  it "is able to keep a record of all withdrawals" do
    transaction_1 = [@current_date, "", "1000.00", "-1000.00"]
    transaction_2 = [@current_date, "", "10.50", "-1010.50"]
    @subject.money_in(transaction_1)
    @subject.money_in(transaction_2)
    expect(@subject.deposits).to eq([[@current_date, "", "1000.00", "-1000.00"], [@current_date, "", "10.50", "-1010.50"]])
  end

end
