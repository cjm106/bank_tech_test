require_relative "statement"
require_relative "transactionhistory"

class BankAccount

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = TransactionHistory.new
  end

  def deposit(amount)
    @balance += amount
    transaction = [date, format('%<a>.2f', a: amount), "", format('%<b>.2f', b: @balance)]
    @transactions.money_in(transaction)
  end

  def withdraw(amount)
    @balance -= amount
    transaction = [date, "", format('%<a>.2f', a: amount), format('%<b>.2f', b: @balance)]
    @transactions.money_out(transaction)
  end

  def print_statement
    statement = Statement.new(@transactions.deposits, @transactions.withdrawals)
    statement.print
  end

  private

  def date
    Time.now.strftime("%d/%m/%Y")
  end

end
