require_relative "currency_amount"     # => true
require_relative "currency_converter"  # => true

user_money = CurrencyAmount.new(50.0, "USD")          # => #<CurrencyAmount:0x007fee39823e10 @amount=50.0, @currency_code="USD">
check_money_equals = CurrencyAmount.new(50.0, "USD")  # => #<CurrencyAmount:0x007fee39823b40 @amount=50.0, @currency_code="USD">
more_user_money = CurrencyAmount.new(25.0, "USD")     # => #<CurrencyAmount:0x007fee398238e8 @amount=25.0, @currency_code="USD">
jordanian_money = CurrencyAmount.new(30.0, "JOD")     # => #<CurrencyAmount:0x007fee39823668 @amount=30.0, @currency_code="JOD">
money_trader = CurrencyConverter.new #nothing yet
final_amount = user_money+(more_user_money)           # => #<CurrencyAmount:0x007fee398230c8 @amount=75.0, @currency_code="USD">
puts "currency addition= $#{final_amount.amount}"     # => nil
puts final_amount.currency_code                       # => nil

less_money= user_money - more_user_money            # => #<CurrencyAmount:0x007fee39822a88 @amount=25.0, @currency_code="USD">
puts "currency subtraction= $#{less_money.amount}"  # => nil
puts less_money.currency_code                       # => nil

puts money_error = user_money + jordanian_money  # => nil
puts user_money == jordanian_money               # => nil
puts user_money == check_money_equals            # => nil

# >> currency addition= $75.0
# >> USD
# >> currency subtraction= $25.0
# >> USD
# >> Cannot add different currencies
# >> Not Compatible
# >>
# >> Compatible
# >>
