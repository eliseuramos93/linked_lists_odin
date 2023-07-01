require_relative './lib/linked_list.rb'
require_relative './lib/node.rb'

test_list = LinkedList.new

test_list.append('index: 1')
test_list.append('index: 2')
test_list.append('index: 3')
test_list.append('should not appear #1')
test_list.insert_at('index: 5', -1)
test_list.insert_at('index: 6', 5)
test_list.append('should not appear #2')
test_list.prepend('index: 0')
test_list.pop
test_list.insert_at('should not appear #3', 0)
test_list.insert_at('this must return an error', 9)
test_list.insert_at('index: 4', 5)
test_list.remove_at(4)
test_list.remove_at(0)

puts test_list.to_s

