def stock_picker(stock_prices)
  lower = { day: 0, price: stock_prices[0] }
  higher = { day: 0, price: stock_prices[0] }
  profit = { day: [0, 0], price: 0 }
  stock_prices.each_with_index do |price, day|
    if price < lower[:price]
      lower = { day: day, price: price }
      higher = { day: day, price: price }
    elsif price > higher[:price]
      higher = { day: day, price: price }
    end

    if higher[:price] - lower[:price] > profit[:price]
      profit = { day: [lower[:day], higher[:day]], price: higher[:price] - lower[:price] } 
    end
  end
  profit[:day]
end
