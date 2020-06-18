require_relative "statement"

class BankAccount

  attr_reader :deposits, :withdrawals, :balance

  def initialize
    @deposits = []
    @withdrawals = []
    @balance = 0
  end

  def add(amount)
    @balance += amount
    @deposits << [date, format('%<a>.2f', a: amount), "", format('%<b>.2f', b: @balance)]
  end

  def remove(amount)
    @balance -= amount
    @withdrawals << [date, "", format('%<a>.2f', a: amount), format('%<b>.2f', b: @balance)]
  end

  def print_statement
    statement = Statement.new(@deposits, @withdrawals)
    statement.print
  end

  private

  def date
    Time.now.strftime("%d/%m/%Y")
  end

end
