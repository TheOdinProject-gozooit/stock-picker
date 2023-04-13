def stock_picker(arr)
  lower = { index: 0, value: arr[0] }
  higher = { index: 0, value: arr[0] }
  profit = { index: [0, 0], value: 0 }
  arr.each_with_index do |value, index|
    if value < lower[:value]
      lower = { index: index, value: value }
      higher = { index: index, value: value }
    end
    if value > higher[:value]
      higher = { index: index, value: value }
    end
    if higher[:value] - lower[:value] > profit[:value]
      profit = { index: [lower[:index], higher[:index]], value: higher[:value] - lower[:value] }
    end
  end
  profit[:index]
end