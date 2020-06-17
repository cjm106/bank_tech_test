require './lib/transactions'
require './lib/bankaccount'

describe Transactions do

  before(:each) do
    @subject = Transactions.new
    @account = BankAccount.new
    @current_date = Time.now.strftime("%d/%m/%Y")
  end

  it "is able to accept deposits" do
    money_in = [@current_date, "1000.00", "", "1000.00"]
    @account.add(1000)
    expect(@subject.deposits(money_in)).to eq([@current_date, "1000.00", "", "1000.00"])
  end

end
