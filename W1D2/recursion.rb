def sum_to(n)
  return 1 if n == 1
  sum_to(n - 1) + n
end

def add_numbers(arr)
  return arr[0] if arr.length == 1
  add_numbers(arr[1..-1]) + arr[0]
end

# (n-1)! = n! / n
def gamma_fnc(n)
  if n == 1
    return 1
  elsif n > 1
    (n - 1) * gamma_fnc(n - 1)
  end
end

def ice_cream_shop(flavors, favorite)
  flavors.each do |shop|
    ice_cream_shop(shop) if shop.is_a?(Array)
    return true if shop.include?(favorite)
  end
  false
end

def reverse(string)
  return string.first if string.length == 1
  "#{reverse(string[1..-1])}#{string[0]}"
end
