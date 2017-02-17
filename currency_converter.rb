class CurrencyConverter
  def initialize(rates)
    @exchange_rates = rates
  end

  def exchange_rates
    @exchange_rates
  end

  def convert(currency_amount, type)
    if currency_amount.currency_code == type
      return CurrencyAmount.new(currency_amount.amount, type)
    else
      return "Error"
    end
  end

  def money_exchange(money_to_change, currency_to_change_to)
    if exchange_rates.has_key?(money_to_change.currency_code) && exchange_rates.has_key?(currency_to_change_to)
      new_amount = money_to_change.amount * exchange_rates[money_to_change.currency_code][currency_to_change_to]
      return CurrencyAmount.new(new_amount, currency_to_change_to)
    else
      raise DifferentCurrencyCodeError
    end

  end

end
