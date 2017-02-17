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
      "Raise error here"
    end
  end

  def -(other)
    if currency_code == other.currency_code
        new_amount = amount - other.amount
      return CurrencyAmount.new(new_amount,currency_code)
    else
      "Raise error here"
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
    new_amount = amount * f
    return CurrencyAmount.new(new_amount, currency_code)
  end


end
