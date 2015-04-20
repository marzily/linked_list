class RecursiveLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def recursive_iterate(node)
    return node if node.link.nil?
    recursive_iterate(node.link)
  end

  def append(node)
    if head.nil?
      self.head = node
    else
      last_node = recursive_iterate(head)
      last_node.link = node
    end
  end

  def recursive_count(node)
    return 1 if node.link.nil?
    1 + recursive_count(node.link)
  end

  def count
    return 0 if head.nil?
    recursive_count(head)
  end

  def tail
    return head if head.nil?
    recursive_iterate(head)
  end

  def recursive_pop(node)
    prev = node
    current = node.link

    if current.link.nil?
      prev.link = nil
      return current
    end

    recursive_pop(current.link)
  end

  def pop
    return head if head.nil?

    if count == 1
      node = head
      self.head = nil
      node
    else
      recursive_pop(head)
    end
  end

  def recursive_find_index(node, index)
    return node if index == 0
    recursive_find_index(node.link, index - 1)
  end

  def [](index)
    return nil if index > (count - 1)
    recursive_find_index(head, index)
  end

end
