class CurrencyAmount

  def initialize(amount, currency_code)
    @amount = amount
    @currency_code = currency_code
  end                                    # => :initialize

  def amount
    @amount
  end         # => :amount

  def currency_code
    @currency_code
  end                # => :currency_code

  def +(other)
    if currency_code == other.currency_code
      new_amount = amount + other.amount
      return CurrencyAmount.new(new_amount,currency_code)

    else
      puts "Error"
    end
  end               # => :+

end  # => :+
