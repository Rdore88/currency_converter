require_relative "currency_amount"     # => true
require_relative "currency_converter"  # => true

user_money = CurrencyAmount.new(50.0, "USD")                                        # => #<CurrencyAmount:0x007fab1b0bb490 @amount=50.0, @currency_code="USD">
check_money_equals = CurrencyAmount.new(50.0, "USD")                                # => #<CurrencyAmount:0x007fab1b0bb1c0 @amount=50.0, @currency_code="USD">
more_user_money = CurrencyAmount.new(25.0, "USD")                                   # => #<CurrencyAmount:0x007fab1b0baf40 @amount=25.0, @currency_code="USD">
jordanian_money = CurrencyAmount.new(30.0, "JOD")                                   # => #<CurrencyAmount:0x007fab1b0bace8 @amount=30.0, @currency_code="JOD">
money_trader = CurrencyConverter.new({"USD" => 1, "JOD" => 0.709, "INR" => 67.16})  # => #<CurrencyConverter:0x007fab1b0baa68 @exchange_rates={"USD"=>1, "JOD"=>0.709, "INR"=>67.16}>
puts money_trader.exchange_rates                                                    # => nil
final_amount = user_money+(more_user_money)                                         # => #<CurrencyAmount:0x007fab1b0ba360 @amount=75.0, @currency_code="USD">
puts "currency addition= $#{final_amount.amount}"                                   # => nil
puts final_amount.currency_code                                                     # => nil

less_money = user_money - more_user_money           # => #<CurrencyAmount:0x007fab1b0b9cd0 @amount=25.0, @currency_code="USD">
puts "currency subtraction= $#{less_money.amount}"  # => nil
puts less_money.currency_code                       # => nil

p money_error = user_money + jordanian_money   # => "Raise error here"
p user_money == jordanian_money                # => false
p user_money == check_money_equals             # => true
grow_that_money = user_money.change_amount(3)  # => #<CurrencyAmount:0x007fab1b0b8920 @amount=150.0, @currency_code="USD">
puts grow_that_money.amount                    # => nil

# >> {"USD"=>1, "JOD"=>0.709, "INR"=>67.16}
# >> currency addition= $75.0
# >> USD
# >> currency subtraction= $25.0
# >> USD
# >> "Raise error here"
# >> false
# >> true
# >> 150.0
