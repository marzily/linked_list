class IterativeLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(node)
    if head.nil?
      self.head = node
    else
      current = head
      current = current.link until current.link.nil?
      current.link = node
    end
  end

  def prepend(node)
    node.link = head unless head.nil?
    self.head = node
  end

  def insert(node, index)
    if index == 0
      node.link = head
      self.head = node
    else
      prev = find_node(head, index)

      node.link = prev.link
      prev.link = node
    end
  end

  def find_node(prev_node, index)
    i = 1
    while i < index
      prev_node = prev_node.link
      i += 1
    end
    prev_node
  end

  def includes?(data)
    current = head

    until current.nil?
      return true if current.data == data
      current = current.link
    end

    false
  end

  def pop
    if head.nil? || head.link.nil?
      node = head
      self.head = nil
      node
    else
      prev = head
      current = head.link

      until current.link.nil?
        prev = current
        current = current.link
      end

      prev.link = nil
      current
    end
  end

  def count
    return 0 if head.nil?

    total = 1
    current = head
    until current.link.nil?
      current = current.link
      total += 1
    end
    total
  end

  def tail
    return head if head.nil?

    current = head
    until current.link.nil?
      current = current.link
    end
    current
  end

  def [](index)
    return nil if index > (count - 1)

    location = 0
    current = head
    until location == index
      current = current.link
      location += 1
    end
    current
  end

  def shift
    return head if head.nil?

    first_node = head
    self.head = head.link
    first_node
  end

  def unshift(node)
    if head.nil?
      self.head = node
    else
      linked_node = head
      self.head = node
      node.link = linked_node
    end
  end

  def delete(node_data)
    return head if head.nil? || head.data == node_data

    prev = head
    current = head.link

    until current.link.nil?
      if current.data == node_data
        prev.link = current.link
        deleted_node = current
      end

      prev = current
      current = current.link
    end
  end

end
