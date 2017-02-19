class CurrencyTrader

  def initialize(currency_present, currency_future, currency_type)
    @currency_present = currency_present
    @currency_future = currency_future
    @currency_type = currency_type
  end                                                               # => :initialize

def currency_present
  @currency_present
end                   # => :currency_present

def currency_future
  @currency_future
end                  # => :currency_future

def currency_type
  @currency_type
end                # => :currency_type

def best_investment(potential_one, potential_two, years_in_future)
  currency_one = currency_present.exchange_rates[currency_type][potential_one] - currency_future.exchange_rates[years_in_future][currency_type][potential_one]
  currency_two = currency_present.exchange_rates[currency_type][potential_two] - currency_future.exchange_rates[years_in_future][currency_type][potential_two]
  if currency_one > currency_two
    return potential_one
  else
    return potential_two
  end
  end                                                                                                                                                           # => :best_investment
end                                                                                                                                                             # => :best_investment
