class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def add(el)
    # adds an element to the stack
    @stack << el
  end

  def remove
    # removes one element from the stack
    @stack.pop
  end

  def show
    # return a copy of the stack
    @stack
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if @map.any? { |pair| pair.first == key }
      @map.each_index do |pair_idx|
        @map[pair_idx][-1] = value if @map[pair_idx].first == key
      end
    else @map << [key, value]
    end
  end

  def lookup(key)
    @map.each { |pair| return pair[0][1] if pair[0] == key }
    nil
  end

  def remove(key)
    @map.reject! { |pair| pair.first == key }
  end

  def show
    @map
  end
end
