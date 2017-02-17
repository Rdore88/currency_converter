require_relative "currency_amount"     # => true
require_relative "currency_converter"  # => true

user_money = CurrencyAmount.new(50.0, "USD")          # => #<CurrencyAmount:0x007facd2825cb8 @amount=50.0, @currency_code="USD">
check_money_equals = CurrencyAmount.new(50.0, "USD")  # => #<CurrencyAmount:0x007facd2825a10 @amount=50.0, @currency_code="USD">
more_user_money = CurrencyAmount.new(25.0, "USD")     # => #<CurrencyAmount:0x007facd28257b8 @amount=25.0, @currency_code="USD">
jordanian_money = CurrencyAmount.new(30.0, "JOD")     # => #<CurrencyAmount:0x007facd2825560 @amount=30.0, @currency_code="JOD">
final_amount = user_money+(more_user_money)           # => #<CurrencyAmount:0x007facd2825330 @amount=75.0, @currency_code="USD">
puts "currency addition= $#{final_amount.amount}"     # => nil
puts final_amount.currency_code                       # => nil

less_money = user_money - more_user_money           # => #<CurrencyAmount:0x007facd2824cc8 @amount=25.0, @currency_code="USD">
puts "currency subtraction= $#{less_money.amount}"  # => nil
puts less_money.currency_code                       # => nil

p money_error = user_money + jordanian_money   # => "Raise error here"
p user_money == jordanian_money                # => false
p user_money == check_money_equals             # => true
grow_that_money = user_money.change_amount(3)  # => #<CurrencyAmount:0x007facd281f9f8 @amount=150.0, @currency_code="USD">
puts grow_that_money.amount                    # => nil

money_trader = CurrencyConverter.new({"USD" => 1, "JOD" => 0.709, "INR" => 67.16})  # => #<CurrencyConverter:0x007facd281f548 @exchange_rates={"USD"=>1, "JOD"=>0.709, "INR"=>67.16}>
puts money_trader.exchange_rates                                                    # => nil
one_dolla = CurrencyAmount.new(1, "USD")                                            # => #<CurrencyAmount:0x007facd281eee0 @amount=1, @currency_code="USD">
convert_fail = CurrencyAmount.new(1, "JOD")                                         # => #<CurrencyAmount:0x007facd281ebc0 @amount=1, @currency_code="JOD">
clone = money_trader.convert(one_dolla, "USD")                                      # => #<CurrencyAmount:0x007facd281e800 @amount=1, @currency_code="USD">
puts "equal currency converter = $#{clone.amount} #{clone.currency_code}"           # => nil
p error = money_trader.convert(convert_fail, "USD")                                 # => "Error"
#puts "Equal money object: $#{clone.amount} #{clone.currency_code}"                  # ~> NoMethodError: undefined method `amount' for nil:NilClass

# >> currency addition= $75.0
# >> USD
# >> currency subtraction= $25.0
# >> USD
# >> "Raise error here"
# >> false
# >> true
# >> 150.0
# >> {"USD"=>1, "JOD"=>0.709, "INR"=>67.16}
# >> equal currency converter = $1 USD
# >> "Error"
