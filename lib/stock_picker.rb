# Return the pair of day representing the best day to buy and to sell
def stock_picker(stock_prices)
  lowest = { day: 0, price: stock_prices[0] }
  highest = { day: 0, price: stock_prices[0] }
  profit = { day: [0, 0], price: 0 }
  stock_prices.each_with_index do |price, day|
    if price < lowest[:price]
      lowest = { day: day, price: price }
      highest = { day: day, price: price }
    elsif price > highest[:price]
      highest = { day: day, price: price }
    end

    if highest[:price] - lowest[:price] > profit[:price]
      profit = { day: [lowest[:day], highest[:day]], price: highest[:price] - lowest[:price] } 
    end
  end
  profit[:day]
end

# Add TOP example so can be run with "ruby ./stock_picker.rb"

arr = [17, 3, 6, 9, 15, 8, 6, 1, 10]
puts "Using stock picker for #{arr} :"
puts stock_picker(arr) # return [1, 4]
