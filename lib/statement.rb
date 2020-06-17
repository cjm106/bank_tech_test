class Statement

  def initialize(deposits, withdrawals)
    @deposits = deposits
    @withdrawals = withdrawals
  end

  def header
    puts "date || credit || debit || balance"
  end

  def ledger
    entry = [].concat(@deposits).concat(@withdrawals)
    entry = entry.sort_by { |x| x[0] }.reverse
    entry.each do |n|
      puts n.join(' || ').delete_prefix('"').delete_suffix('"')
    end
  end

end
