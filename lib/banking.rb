
class Banking

  attr_reader :deposits, :withdrawals, :balance

  def initialize
    @deposits = []
    @withdrawals = []
    @balance = 0
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def add(amount)
    @balance += amount
    @deposits << [ @date, amount, "", @balance ]
  end

  def remove(amount)
    @balance -= amount
    @withdrawals << [ @date, "", amount, @balance ]
  end

  def print_header
    return "date || credit || debit || balance"
  end

end
