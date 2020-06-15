require './lib/banking'

describe Banking do

  subject = Banking.new

  it "is able to accept deposits" do
    current_date = Time.now.strftime("%d/%m/%Y")
    subject.add(1000)
    expect(subject.deposits).to eq([[1000, current_date]])
  end


end
