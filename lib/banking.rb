
class Banking

  attr_reader :deposits, :withdrawals, :balance

  def initialize
    @deposits = []
    @withdrawals = []
    @balance = 0
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def add(amount)
    @deposits << [amount, @date]
    @balance += amount
  end

  def remove(amount)
    @withdrawals << [amount, @date]
  end

end
