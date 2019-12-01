# Implement a method stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return
# a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#
# stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]
#

def stock_picker(prices)
    pairs = {}
    prices.each_with_index do |buy_value, buy_value_index|
        prices.each_with_index do |sell_value, sell_value_index|
             pairs[[buy_value_index, sell_value_index]] = sell_value - buy_value if sell_value_index > buy_value_index
        end
    end
    p pairs.key(pairs.values.max)
end

stock_picker([17,3,6,9,15,8,6,1,10])
