require 'pry'

class LinkedList
  attr_accessor :head, :tail

  def initialize(val)
    self.head = ListNode.new(val)
    self.tail = self.head
  end

  def add(val)
    self.tail.next = ListNode.new(val)
    self.tail = self.tail.next
  end

  def find(item)
    current = self.head
    until current.next == nil
      if current.val == item
        return current
      end

      current = current.next
    end
    return nil
  end

  def insert_after(index, val)
    # if provided a ListNode as the index, such as after a #find call, go straight there
    if index.class == LinkedList::ListNode
      currentNode = index
    # otherwise advance through the list until the indexed node is found
    elsif index.class == Integer
      i = 0
      currentNode = self.head
      until i == index do
        currentNode = currentNode.next
        i += 1
      end
    end
      
    temp = currentNode.next
    newNode = ListNode.new(val)
    currentNode.next = newNode
    newNode.next = temp
    return self
  end

  class ListNode
    attr_accessor :val, :next

    def initialize(val)
      self.val = val
      self.next = nil
    end
  end
end

ll = LinkedList.new(1)
ll.add(2)
ll.add(3)
ll.add(4)
ll.add(5)
ll.add(6)
ll.add(7)

binding.pry