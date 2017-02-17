require_relative "error"
class CurrencyAmount

  def initialize(money_input, currency_code= nil)
    types = {"$" => "USD", "₹" => "INR", "£" => "JOD"}  # => {"$"=>"USD", "₹"=>"INR", "£"=>"JOD"}
    if money_input.is_a?(String)                        # => true
      code = money_input[0]                             # => "$"
      money_input.slice!(0)                             # => "$"
      @amount = money_input.to_f                        # => 100.0
      @currency_code = types[code]                      # => "USD"
    else
      @amount = money_input
      @currency_code = currency_code
    end                                                 # => "USD"
  end                                                   # => :initialize

  def amount
    @amount   # => 100.0
  end         # => :amount

  def currency_code
    @currency_code   # => "USD"
  end                # => :currency_code

  def +(other)
    if currency_code == other.currency_code
      new_amount = amount + other.amount
      return CurrencyAmount.new(new_amount,currency_code)
    else
      "Raise error here"
    end
  end                                                      # => :+

  def -(other)
    if currency_code == other.currency_code
        new_amount = amount - other.amount
      return CurrencyAmount.new(new_amount,currency_code)
    else
      "Raise error here"
    end
  end                                                      # => :-

  def ==(other)
    if currency_code == other.currency_code
      true
    else
      false
    end
  end                                        # => :==

  def change_amount(f)
    new_amount = amount * f
    return CurrencyAmount.new(new_amount, currency_code)
  end                                                     # => :change_amount


end                                 # => :change_amount
              # => "USD"

# >> 100.0
# >> "USD"
