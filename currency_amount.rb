require_relative "error"
class CurrencyAmount

  def initialize(money_input, currency_code= nil)
    types = {"$" => "USD", "₹" => "INR", "£" => "JOD"}
    if money_input.is_a?(String)
      code = money_input[0]
      money_input.slice!(0)
      @amount = money_input.to_f
      @currency_code = types[code]
    else
      @amount = money_input
      @currency_code = currency_code
    end
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
      return CurrencyAmount.new(new_amount, currency_code)
    end
      raise DifferentCurrencyCodeError
  end

  def -(other)
     if currency_code == other.currency_code
      new_amount = amount - other.amount
      return CurrencyAmount.new(new_amount, currency_code)
    end
    raise DifferentCurrencyCodeError
  end

  def ==(other)
    if currency_code == other.currency_code && amount == other.amount
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
