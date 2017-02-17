require_relative "currency_amount"     # => true
require_relative "currency_converter"  # => true

user_money = CurrencyAmount.new(50.0, "USD")          # => #<CurrencyAmount:0x007fd1ac81e630 @amount=50.0, @currency_code="USD">
check_money_equals = CurrencyAmount.new(50.0, "USD")  # => #<CurrencyAmount:0x007fd1ac81e388 @amount=50.0, @currency_code="USD">
more_user_money = CurrencyAmount.new(25.0, "USD")     # => #<CurrencyAmount:0x007fd1ac81e130 @amount=25.0, @currency_code="USD">
jordanian_money = CurrencyAmount.new(30.0, "JOD")     # => #<CurrencyAmount:0x007fd1ac81deb0 @amount=30.0, @currency_code="JOD">
final_amount = user_money+(more_user_money)           # => #<CurrencyAmount:0x007fd1ac81db90 @amount=75.0, @currency_code="USD">
puts "currency addition= $#{final_amount.amount}"     # => nil
puts final_amount.currency_code                       # => nil

less_money = user_money - more_user_money           # => #<CurrencyAmount:0x007fd1ac81d500 @amount=25.0, @currency_code="USD">
puts "currency subtraction= $#{less_money.amount}"  # => nil
puts less_money.currency_code                       # => nil

p money_error = user_money + jordanian_money   # => "Raise error here"
p user_money == jordanian_money                # => false
p user_money == check_money_equals             # => true
grow_that_money = user_money.change_amount(3)  # => #<CurrencyAmount:0x007fd1ac81c628 @amount=150.0, @currency_code="USD">
puts grow_that_money.amount                    # => nil

money_trader = CurrencyConverter.new({                                                                                                # => CurrencyConverter
                                      "USD" => {
                                        "JOD" => 0.709,                                                                               # => 0.709
                                        "INR" => 67.16                                                                                # => 67.16
                                      },                                                                                              # => {"JOD"=>0.709, "INR"=>67.16}
                                      "JOD" => {
                                        "USD" => 1.41,                                                                                # => 1.41
                                        "INR" => 94.57                                                                                # => 94.57
                                      },                                                                                              # => {"USD"=>1.41, "INR"=>94.57}
                                      "INR" => {
                                        "USD" => 0.015,                                                                               # => 0.015
                                        "JOD" => 0.0106                                                                               # => 0.0106
                                      }                                                                                               # => {"USD"=>0.015, "JOD"=>0.0106}
                                    }                                                                                                 # => {"USD"=>{"JOD"=>0.709, "INR"=>67.16}, "JOD"=>{"USD"=>1.41, "INR"=>94.57}, "INR"=>{"USD"=>0.015, "JOD"=>0.0106}}
                                    )                                                                                                 # => #<CurrencyConverter:0x007fd1ac816b88 @exchange_rates={"USD"=>{"JOD"=>0.709, "INR"=>67.16}, "JOD"=>{"USD"=>1.41, "INR"=>94.57}, "INR"=>{"USD"=>0.015, "JOD"=>0.0106}}>
one_dolla = CurrencyAmount.new(1, "USD")                                                                                              # => #<CurrencyAmount:0x007fd1ac816430 @amount=1, @currency_code="USD">
convert_fail = CurrencyAmount.new(1, "JOD")                                                                                           # => #<CurrencyAmount:0x007fd1ac8160c0 @amount=1, @currency_code="JOD">
rupee = CurrencyAmount.new(20000, "INR")                                                                                              # => #<CurrencyAmount:0x007fd1ac815d78 @amount=20000, @currency_code="INR">
clone = money_trader.convert(one_dolla, "USD")                                                                                        # => #<CurrencyAmount:0x007fd1ac815a58 @amount=1, @currency_code="USD">
puts "equal currency converter = $#{clone.amount} #{clone.currency_code}"                                                             # => nil
p error = money_trader.convert(convert_fail, "USD")                                                                                   # => "Error"
jod_to_usd = money_trader.money_exchange(jordanian_money, "USD")                                                                      # => #<CurrencyAmount:0x007fd1ac815350 @amount=42.3, @currency_code="USD">
rupee_to_jod = money_trader.money_exchange(rupee, "JOD")                                                                              # => #<CurrencyAmount:0x007fd1ac8150a8 @amount=212.0, @currency_code="JOD">
puts "#{jordanian_money.amount} in #{jordanian_money.currency_code} is equal to #{jod_to_usd.amount} in #{jod_to_usd.currency_code}"  # => nil
puts "#{rupee.amount} in #{rupee.currency_code} is equal to #{rupee_to_jod.amount} in #{rupee_to_jod.currency_code}"                  # => nil

# >> currency addition= $75.0
# >> USD
# >> currency subtraction= $25.0
# >> USD
# >> "Raise error here"
# >> false
# >> true
# >> 150.0
# >> equal currency converter = $1 USD
# >> "Error"
# >> 30.0 in JOD is equal to 42.3 in USD
# >> 20000 in INR is equal to 212.0 in JOD
