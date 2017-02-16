require_relative "currency_amount"
require_relative "currency_converter"

user_money = CurrencyAmount.new(50.0, "USD")
more_user_money = CurrencyAmount.new(25.0, "USD")
jordanian_money = CurrencyAmount.new(30.0, "JOD")
money_trader = CurrencyConverter.new #nothing yet
final_amount = user_money+(more_user_money)
puts "currency addition= $#{final_amount.amount}"
puts final_amount.currency_code

less_money= user_money - more_user_money
puts "currency subtraction= $#{less_money.amount}"
puts less_money.currency_code

puts money_error = user_money + jordanian_money

puts user_money == jordanian_money
