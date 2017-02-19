require_relative "currency_amount"
require_relative "currency_converter"
require_relative "currency_trader"
require_relative "error"

user_money = CurrencyAmount.new(50.0, "USD")
check_money_equals = CurrencyAmount.new(50.0, "USD")
more_user_money = CurrencyAmount.new(25.0, "USD")
jordanian_money = CurrencyAmount.new(30.0, "JOD")
final_amount = user_money+(more_user_money)
puts "currency addition= $#{final_amount.amount}"
puts final_amount.currency_code

less_money = user_money - more_user_money
puts "currency subtraction= $#{less_money.amount}"

begin
p money_error = user_money + jordanian_money
rescue DifferentCurrencyCodeError
end
p user_money == jordanian_money
p user_money == check_money_equals
grow_that_money = user_money.change_amount(3)
puts grow_that_money.amount

money_trader_present = CurrencyConverter.new(
  {
    "USD" => {
      "JOD" => 0.709,
      "INR" => 67.16
    },
    "JOD" => {
      "USD" => 1.41,
      "INR" => 94.57
    },
    "INR" => {
      "USD" => 0.015,
      "JOD" => 0.0106
    }
  }
)
money_trader_future = CurrencyConverter.new({
                                      "1 Year" => {
                                        "USD" => {
                                          "JOD" => 0.609,
                                          "INR" => 84.32
                                        },
                                        "JOD" => {
                                          "USD" => 2.33,
                                          "INR" => 112.45
                                        },
                                        "INR" => {
                                          "USD" => 0.009,
                                          "JOD" => 0.0074
                                        }
                                      },
                                      "5 Years" => {
                                        "USD" => {
                                          "JOD" => 0.509,
                                          "INR" => 90.32
                                        },
                                        "JOD" => {
                                          "USD" => 2.78,
                                          "INR" => 120.45
                                        },
                                        "INR" => {
                                          "USD" => 0.008,
                                          "JOD" => 0.0064
                                        }
                                      },
                                      "10 Years" => {
                                        "USD" => {
                                          "JOD" => 0.909,
                                          "INR" => 60.32
                                        },
                                        "JOD" => {
                                          "USD" => 1.04,
                                          "INR" => 85.76
                                        },
                                        "INR" => {
                                          "USD" => 0.011,
                                          "JOD" => 0.02
                                        }
                                      },
                                    }
                                    )

one_dolla = CurrencyAmount.new(1, "USD")
convert_fail = CurrencyAmount.new(1, "JOD")
rupee = CurrencyAmount.new(20000, "INR")
clone = money_trader_present.convert(one_dolla, "USD")
puts "equal currency converter = $#{clone.amount} #{clone.currency_code}"
p error = money_trader_present.convert(convert_fail, "USD")
jod_to_usd = money_trader_present.money_exchange(jordanian_money, "USD")
rupee_to_jod = money_trader_present.money_exchange(rupee, "JOD")
puts "#{jordanian_money.amount} in #{jordanian_money.currency_code} is equal to #{jod_to_usd.amount} in #{jod_to_usd.currency_code}"
puts "#{rupee.amount} in #{rupee.currency_code} is equal to #{rupee_to_jod.amount} in #{rupee_to_jod.currency_code}"
begin
convert_fail =  money_trader_present.money_exchange(jordanian_money, "HFY")
rescue DifferentCurrencyCodeError
end
trader = CurrencyTrader.new(money_trader_present, money_trader_future, "USD")
investment = trader.best_investment("JOD", "INR", "5 Years")
puts "The best investment is #{investment}"
money = CurrencyAmount.new("$100")
p money.amount
p money.currency_code
