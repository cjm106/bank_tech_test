require './lib/banking'

describe Banking do

 before(:each) do
   @subject = Banking.new
   @current_date = Time.now.strftime("%d/%m/%Y")
 end


  it "is able to accept deposits" do
    @subject.add(1000)
    expect(@subject.deposits).to eq([[ @current_date, 1000, "", 1000]])
  end

  it "is able to accept withdrawal requests" do
    @subject.remove(500)
    expect(@subject.withdrawals).to eq([[ @current_date, "", 500, -500]])
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

  it "is able to return a statement header  "do
    expect(subject.print_header).to eq("date || credit || debit || balance")
  end


end
