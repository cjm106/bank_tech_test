
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

    def statement
      balance_sheet = [].concat(@deposits).concat(@withdrawals)
      balance_sheet = balance_sheet.sort_by{|x|x[0]}.reverse
      balance_sheet.each do |n|
        return n*' || '
      end
    end


  end
