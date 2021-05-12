# You want to be able to access the largest element in a stack.

# You've already implemented this Stack class:

  class Stack
  def initialize  # Initializes an empty stack.
    @items = []
  end
  
  def push(item)  # Pushes a new item onto the stack.
    @items << item
  end

  def pop  # Removes and returns the last item.
    if @items.empty?
      nil  # If the stack is empty, returns nil.
    else
      @items.pop
    end
  end

  def peek  # Returns the last item without removing it.
    if @items.empty?
      nil
    else
      @items[-1]
    end
  end
end

# Use your Stack class to implement a new class MaxStack with a method get_max() that returns the largest element in the stack. get_max() should not remove the item.

# Your stacks will contain only integers. 

# -- Brainstorming --
# Can create a stack for keeping track of maxes and another for keeping track of all items
# as we add to MaxStack, check if the item is greater than the last item in our stack
# if it is, push it onto the stack
# regardless, push the item onto the main stack

class MaxStack
  def initialize
    @max_stack = Stack.new
    @stack = Stack.new
  end

  def push(item)
    if !@max_stack.peek || item >= @max_stack.peek
      @max_stack << item
    end
    @stack << item
  end

  def pop
    item = @stack.pop
    if @max_stack.peek == item
      @max_stack.pop
    end
    item
  end

  def get_max
    @max_stack.peek
  end
end
