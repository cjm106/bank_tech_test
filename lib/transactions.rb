class Transactions

  attr_reader :deposits, :withdrawals

  def initialize
    @deposits = []
    @withdrawals = []
  end

  def money_in(transaction)
    @deposits << transaction
  end

  def money_out(transaction)
    @withdrawals << transaction
  end

end
