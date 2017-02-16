require_relative "currency_amount"     # => true
require_relative "currency_converter"  # => true

user_money = CurrencyAmount.new(50.0, "USD")          # => #<CurrencyAmount:0x007fe0610b3788 @amount=50.0, @currency_code="USD">
check_money_equals = CurrencyAmount.new(50.0, "USD")  # => #<CurrencyAmount:0x007fe0610b34b8 @amount=50.0, @currency_code="USD">
more_user_money = CurrencyAmount.new(25.0, "USD")     # => #<CurrencyAmount:0x007fe0610b3260 @amount=25.0, @currency_code="USD">
jordanian_money = CurrencyAmount.new(30.0, "JOD")     # => #<CurrencyAmount:0x007fe0610b2fb8 @amount=30.0, @currency_code="JOD">
money_trader = CurrencyConverter.new #nothing yet
final_amount = user_money+(more_user_money)           # => #<CurrencyAmount:0x007fe0610b2a40 @amount=75.0, @currency_code="USD">
puts "currency addition= $#{final_amount.amount}"     # => nil
puts final_amount.currency_code                       # => nil

less_money = user_money - more_user_money           # => #<CurrencyAmount:0x007fe0610b2388 @amount=25.0, @currency_code="USD">
puts "currency subtraction= $#{less_money.amount}"  # => nil
puts less_money.currency_code                       # => nil

puts money_error = user_money + jordanian_money  # => nil
p user_money == jordanian_money                  # => false
p user_money == check_money_equals               # => true
grow_that_money = user_money.change_amount(3)    # => #<CurrencyAmount:0x007fe0610b1618 @amount=150.0, @currency_code="USD">
puts grow_that_money.amount                      # => nil

# >> currency addition= $75.0
# >> USD
# >> currency subtraction= $25.0
# >> USD
# >> Cannot add different currencies
# >> false
# >> true
# >> 150.0
