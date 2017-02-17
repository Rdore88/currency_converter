class CurrencyConverter
  def initialize(rates)
    @exchange_rates = rates
  end

  def exchange_rates
    @exchange_rates
  end

  def convert(currency_amount, type)
    if currency_amount.currency_code == type
      return CurrencyAmount.new(1, "USD")
    else
      return "Error"
    end
  end

  def money_exchange(money_to_change, currency_to_change_to)
    new_amount = money_to_change.amount * exchange_rates[currency_to_change_to]
    return CurrencyAmount.new(new_amount, currency_to_change_to)
  end


end
