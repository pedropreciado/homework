class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end


s = Stack.new
s.add(1)
s.add(2)
s.add(3)
s.show
s.remove
s.show
s.remove
s.show
