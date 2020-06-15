require './lib/banking'

describe Banking do

  subject = Banking.new

  current_date = Time.now.strftime("%d/%m/%Y")

  it "is able to accept deposits" do
    subject.add(1000)
    expect(subject.deposits).to eq([[1000, current_date]])
  end

  it "is able to accept withdrawal requests" do

   subject.remove(500)
    expect(subject.withdrawals).to eq([[500, current_date]])

  end
end
