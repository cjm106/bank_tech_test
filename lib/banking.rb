
class Banking

  attr_reader :deposits, :withdrawals

  def initialize
    @deposits = []
    @withdrawals = []
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def add(amount)
    @deposits << [amount, @date]
  end

  def remove(amount)
    @withdrawals << [amount, @date]
  end

end
