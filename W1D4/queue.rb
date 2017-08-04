class Queue
  def initialize(queue = [])
    @queue = queue
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    p @queue
  end
end


q = Queue.new
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.show
q.dequeue
q.show
q.dequeue
q.show
q.dequeue
q.show
