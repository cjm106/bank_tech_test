require_relative "statement"
require_relative "transactions"

class BankAccount

  attr_reader :deposits, :withdrawals, :balance

  def initialize
    @deposits = []
    @withdrawals = []
    @balance = 0
    @date = Time.now.strftime("%d/%m/%Y")
    @transaction = Transactions.new
  end

  def add(amount)
    @balance += amount
    @deposits << [@date, format('%<a>.2f', a: amount), "", format('%<b>.2f', b: @balance)]
    @transaction.money_in(@deposits)
  end

  def remove(amount)
    @balance -= amount
    @withdrawals << [@date, "", format('%<a>.2f', a: amount), format('%<b>.2f', b: @balance)]
    @transaction.money_out(@withdrawals)
  end

  def print_statement
    statement = Statement.new(@deposits, @withdrawals)
    statement.header
    statement.ledger
  end

end
