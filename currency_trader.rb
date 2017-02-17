class CurrencyTrader

  def initialize(currency_present, currency_future, currency_type)
    @currency_present = currency_present
    @currency_future = currency_future
    @currency_type = currency_type
  end

def currency_present
  @currency_present
end

def currency_future
  @currency_future
end

def currency_type
  @currency_type
end

def best_investment(potential_one, potential_two)
  currency_one = currency_present.exchange_rates[currency_type][potential_one] - currency_future.exchange_rates[currency_type][potential_one]
  currency_two = currency_present.exchange_rates[currency_type][potential_two] - currency_future.exchange_rates[currency_type][potential_two]
  if currency_one > currency_two
    return potential_one
  else
    return potential_two
  end
  end
end
