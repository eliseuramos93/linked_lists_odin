class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end 
end 


# start => index: 4 | before: 0 | current: 1
# loop 1 => true | index: 3 | before: 1 | current: 2
# loop 2 => true | index: 2 | before: 2 | current: 3
# loop 3 => true | index: 1 | before: 3 | current: 4
# loop 4 => false | index: 0 | before: 3 | current: 4