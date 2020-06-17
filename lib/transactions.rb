class Transactions

  attr_reader :deposits

  def initialize
    @deposits = []
  end

  def money_in(transaction)
    @deposits << transaction
  end

  def money_out(transaction)
    transaction
  end

end
