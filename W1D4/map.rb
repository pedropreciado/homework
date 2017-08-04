class Map
  def initialize(map = [])
    @map = map

  end

  def assign(k, v)
    if lookup(k).nil?
      @map << [k, v]
    else
      @map[@map.find_index([k, lookup(k)])] = [k, v]
    end
  end

  def lookup(key)
    @map.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def remove(key)
    @map.delete([key, lookup(key)])
  end

  def show
    p dd(@map)
  end

  def dd(arr) # [[1, 2], [3, 4]]
    sub_arr = []
    arr.each do | el |
      if el.is_a?(Array)
        sub_arr << dd(el)
      else
        sub_arr << el
      end
    end
    sub_arr
  end
end

m = Map.new
m.assign(1,2)
m.assign(2, 3)
m.show
p "lookup 1: #{m.lookup(1)}"
m.assign(1, 100)
m.assign(2, 200)
m.show
m.remove(2)
m.show
m.remove(1)
m.show
