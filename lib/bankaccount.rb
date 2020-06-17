require_relative "statement"
require_relative "transactions"

class BankAccount

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @date = Time.now.strftime("%d/%m/%Y")
    @transactions = Transactions.new
  end

  def add(amount)
    @balance += amount
    transaction = [@date, format('%<a>.2f', a: amount), "", format('%<b>.2f', b: @balance)]
    @transactions.money_in(transaction)
  end

  def remove(amount)
    @balance -= amount
    transaction = [@date, "", format('%<a>.2f', a: amount), format('%<b>.2f', b: @balance)]
    @transactions.money_out(transaction)
  end

  def print_statement
    statement = Statement.new(@transactions.deposits, @transactions.withdrawals)
    statement.header
    statement.ledger
  end

end
