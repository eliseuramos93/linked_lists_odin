class LinkedList

  attr_reader :head, :tail

  def initialize
    @head = nil           # in a list of size 1, the head and tail elements have
    @tail = nil           # same reference, to enable append and prepend below
  end 

  def append(value)
    node = Node.new(value)
    @head = node if list_empty?                 
    @tail.next_node = node unless @tail.nil?    # if tail is nil, avoids error
    @tail = node
  end 

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head unless list_empty?   # if head is nil, avoids error
    @tail = node if @tail.nil?                  # if tail is nil, list is empty
    @head = node 
  end 

  def size
    count = 0
    return count if list_empty?

    current = @head

    until current.nil?
      count += 1
      current = current.next_node
    end 

    count
  end 

  def head
    return @head unless list_empty?
    nil 
  end 

  def tail
    return @tail unless @tail.nil?
    nil
  end 

  def at(index)
    return self.head if index == 0
    return self.tail if index == -1

    current = @head
    until index == 0 || current.nil? 
      current = current.next_node
      index -= 1
    end 

    return current unless current.nil?
    nil
  end

  def pop
    value = @tail.value
    
    unless @tail.nil?
      index = self.size - 2
      current = @head

      while index > 0
        current = current.next_node
        index -= 1
      end 

      @tail = current
      @tail.next_node = nil
    end 

    value
  end 

  def contains?(value)
    return false if list_empty?

    current = @head
    value_found = false 
    end_of_list = false
    
    until value_found || end_of_list
      value_found = current.value == value
      current = current.next_node
      end_of_list = current.nil? 
    end 

    value_found
  end

  def find(value)
    return nil if list_empty?

    current = @head
    index = 0
    value_found = false
    end_of_list = false

    until value_found || end_of_list
      value_found = current.value == value
      current = current.next_node
      end_of_list = current.nil? 
      index += 1 unless value_found
    end 

    value_found ? index : nil
  end 

  def to_s
    return 'nil' if list_empty?
    
    string = ''
    current = @head
    end_of_list = false 

    until end_of_list
      string = string + "( #{current.value} ) -> "
      current = current.next_node
      end_of_list = current.nil?
    end 

    string + 'nil'
  end 

  def insert_at(value, index)
    return puts 'error: index outside of list limits', '' if index > self.size || index < -2
    return self.append(value) if index == -1 || index == self.size    # DRY
    return self.prepend(value) if index == 0                          # DRY

    current = @head 
    after = @head.next_node
    until index == 0
      current = current.next_node
      after = after.next_node
      index -= 1
    end 

    node = Node.new(value)
    node.next_node = after        # we insert in the list by linking the after node to the new one
    current.next_node = node      # and by overwriting the reference of the current to the new one
  end

  def remove_at(index)
    return puts 'error: index doesn\'t exist in list', '' if index >= self.size || index < -2
    return self.pop if index == self.size-1 || index == -1  # DRY
    return @head = @head.next_node if index == 0            # DRY

    before = @head
    current = @head.next_node
    while index > 0
      index -= 1
      before = current
      current = current.next_node
    end 

    before.next_node = current.next_node    # to remove the reference is to delete
  end 

  protected 

  attr_writer :head, :tail

  def list_empty?
    @head.nil?
  end 
end 