class CurrencyAmount

  def initialize(amount, currency_code)
    @amount = amount
    @currency_code = currency_code
  end

  def amount
    @amount
  end

  def currency_code
    @currency_code
  end

  def +(other)
    if currency_code == other.currency_code
      new_amount = amount + other.amount
      return CurrencyAmount.new(new_amount,currency_code)

    else
      "Cannot add different currencies"
    end
  end

  def -(other)
    if currency_code == other.currency_code
        new_amount = amount - other.amount
      return CurrencyAmount.new(new_amount,currency_code)
    else
        "Cannot subtract different currencies"
    end
  end

  def ==(other)
    if currency_code == other.currency_code
      true
    else
      false
    end
  end

  def change_amount(f)
    @amount = amount * f
  end


end
