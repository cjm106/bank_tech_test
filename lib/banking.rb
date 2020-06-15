
class Banking

  attr_reader :deposits

  def initialize
    @deposits = []
  end

  def add(amount)
    date = Time.now.strftime("%d/%m/%Y")

    @deposits << [amount, date]

  end


end
