require 'pry'

class LinkedList
  attr_accessor :head, :tail

  class ListNode
    attr_accessor :previous, :name, :next

    def initialize(name)
      self.previous = nil
      self.next = nil
      self.name = name
    end
  end

  def initialize
    self.head = nil
    self.tail = nil
  end

  def push(name)
    if self.head
      new_node = ListNode.new(name)
      new_node.previous = self.tail
      self.tail.next = new_node
      self.tail = new_node
    else
      new_node = ListNode.new(name)
      self.head = new_node
      self.tail = new_node
    end
    return new_node
  end

  def access(node)
    if self.tail == node
      return
    elsif self.head == node
      self.head = node.next
      self.head.previous = nil
    else
      node.previous.next = node.next
      node.next.previous = node.previous
    end

    self.tail.next = node
    node.previous = self.tail
    self.tail = node
    self.tail.next = nil
  end

  def replace_head(name)
    self.head = self.head.next
    self.head.previous = nil
    self.push(name)
  end
end

class Queue
  attr_accessor :queue_hash, :queue_list, :limit

  def initialize(limit)
    self.queue_hash = {}
    self.queue_list = LinkedList.new
    self.limit = limit
  end

  def get(id)
    if queue_hash[id]
      queue_list.access(queue_hash[id])
      return queue_hash[id].name
    else
      raise ArgumentError.new "id not found in queue"
    end
  end

  def set(id, name)
    if self.queue_hash.keys.length < limit
      new_node = queue_list.push(name)
    else
      queue_hash.delete_if {|key, node| node == queue_list.head}
      queue_list.replace_head(name)
    end

    queue_hash[id] = queue_list.tail

    return name
  end

  def print_list
    current_node = self.queue_list.head
    until current_node == nil do
      p current_node.name
      current_node = current_node.next
    end
  end
end


q = Queue.new(3)
q.set(1, "Chris")
q.set(2, "Kristin")
q.set(3, "Luca")

binding.pry