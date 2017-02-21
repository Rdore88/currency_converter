require_relative "currency_amount"
require_relative "currency_converter"
require_relative "currency_trader"
require_relative "error"
require "minitest/autorun"
require "minitest/pride"
require "minitest/focus"

class MoneyTraderTest < Minitest::Test

  def test_currency_trader
    my_money = CurrencyAmount.new(50.0, "USD")
    other_money = CurrencyAmount.new("$25")
    assert_equal 50.0, my_money.amount
    assert_equal "USD", my_money.currency_code
    assert_equal 25.0, other_money.amount
    assert_equal "USD", other_money.currency_code
    assert_equal false, my_money == other_money
  end

  def test_add_currency_objects
    my_money = CurrencyAmount.new(50.0, "USD")
    other_money = CurrencyAmount.new("$25")
    new_amount = my_money + other_money
    assert_equal 75.0, new_amount.amount
    assert_equal "USD", new_amount.currency_code
  end

  def test_subtract_currency_objects
    my_money = CurrencyAmount.new(50.0, "USD")
    other_money = CurrencyAmount.new("$25")
    new_amount = my_money - other_money
    assert_equal 25.0, new_amount.amount
    assert_equal "USD", new_amount.currency_code
  end

  def test_multiply_currency_objects
    my_money = CurrencyAmount.new(50.0, "USD")
    new_amount = my_money.change_amount(3)
    assert_equal 150.0, new_amount.amount
  end

  def test_money_exchange_currency_converter
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
    jordanian_money = CurrencyAmount.new(30.0, "JOD")
    jod_to_usd = money_trader_present.money_exchange(jordanian_money, "USD")
    assert_equal 42.3, jod_to_usd.amount
    assert_equal "USD", jod_to_usd.currency_code
  end

  def test_currency_trader
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
    trader = CurrencyTrader.new(money_trader_present, money_trader_future, "USD")
    investment = trader.best_investment("JOD", "INR", "5 Years")
    assert_equal "JOD", investment
  end

end
