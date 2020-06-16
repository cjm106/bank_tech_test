require_relative "statement"

class BankAccount

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

  def print_statement
    statement = Statement.new(@deposits, @withdrawals)
    statement.header
    statement.ledger
  end

end
