class Stack

  attr_accessor :ivar

   def initialize
     # create ivar to store stack here!
     @ivar = []
   end

   def push(el)
     # adds an element to the stack
     @ivar << el
   end

   def pop
     # removes one element from the stack
     @ivar.pop
   end

   def peek
     # returns, but doesn't remove, the top element in the stack
     @ivar.first
   end

   def output
     @ivar.each do |el|
       puts "#{el} "
     end
   end
 end

class Queue
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def enqueue(el)
    @stack << el
  end

  def dequeue
    @stack.shift
  end

  def peek
    @stack.first
  end

  def output
    @stack.each do |el|
      puts "#{el} "
    end
  end
end

class Map
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def set(key,value)
    @stack << [key,value]
  end

  def get(key)
    @stack.each do |k|
      return k[1] if k[0] == key
    end
  end

  def delete(key)
    @stack.each_with_index do |k,idx|
      if k[0] == key
        @stack[idx],@stack[-1] = @stack[-1],@stack[idx]
        return @stack.pop
      end
    end
  end

  def show
    @stack
  end
  
end
