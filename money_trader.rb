require_relative "currency_amount"     # => true
require_relative "currency_converter"  # => true

user_money = CurrencyAmount.new(50.0, "USD")       # => #<CurrencyAmount:0x007fbdbf03a280 @amount=50.0, @currency_code="USD">
more_user_money = CurrencyAmount.new(25.0, "USD")  # => #<CurrencyAmount:0x007fbdbf039f88 @amount=25.0, @currency_code="USD">
money_trader = CurrencyConverter.new #nothing yet
final_amount = user_money+(more_user_money)        # => #<CurrencyAmount:0x007fbdbf039998 @amount=75.0, @currency_code="USD">
puts "$#{final_amount.amount}"                          # => nil
puts final_amount.currency_code                    # => nil

# >> 75.0
# >> USD
