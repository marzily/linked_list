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
      insert_find_node(node, index)
    end
  end

  def insert_find_node(node, index)
    prev = head

    i = 1
    while i < index
      prev = prev.link
      i += 1
    end

    node.link = prev.link
    prev.link = node
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
      pop_loop
    end
  end

  def pop_loop
    prev = head
    current = head.link

    until current.link.nil?
      prev = current
      current = current.link
    end

    prev.link = nil
    current
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
    return if head.nil?

    current = head
    current = current.link until current.link.nil?
    current
  end

# find_by_index
  def [](index)
    return if index > (count - 1)

    location = 0
    current = head
    until location == index
      current = current.link
      location += 1
    end
    current
  end

  def find_by_value(data)
    index = 0
    current = head

    until current.data == data
      current = current.link
      index += 1
    end

    index
  end

  def remove_by_index(index)
    if index > count
      nil
    elsif index == 0
      node = head
      self.head = head.link
      node
    elsif index == 1
      node = head.link
      head.link = head.link.link
      node
    else
      remove_by_index_loop(index)
    end
  end

  def remove_by_index_loop(index)
    prev = head
    current = head.link

    i = 1
    until i == index
      prev = current
      current = current.link
      i += 1
    end

    prev.link = current.link
    current
  end

  def remove_by_value(data)
    if head.nil? || head.data == data
      node = head
      self.head = head.link
      node
    else
      remove_by_value_loop(data)
    end
  end

  def remove_by_value_loop(data)
    prev = head
    current = head.link

    until current.data == data
      prev = current
      current = current.link
    end

    prev.link = current.link
    current
  end

  def distance(value1, value2)
    find_by_value(value2) - find_by_value(value1)
  end
end
