class RecursiveLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(node, list_node = head)
    if head.nil?
      self.head = node
    elsif list_node.link.nil?
      list_node.link = node
    else
      append(node, list_node.link)
    end
  end

  def prepend(node)
    node.link = head unless head.nil?
    self.head = node
  end

  def insert(node, index, list_node = head)
    if index == 0
      node.link = head
      self.head = node
    elsif index == 1
      node.link = list_node.link
      list_node.link = node
    else
      insert(node, index - 1, list_node.link)
    end
  end

  def includes?(data, list_node = head)
    if list_node.nil?
      false
    elsif list_node.data == data
      true
    else
      includes?(data, list_node.link)
    end
  end

  def pop(list_node = head)
    if head.nil? || head.link.nil?
      node = head
      self.head = nil
      node
    elsif list_node.link.link.nil?
      node = list_node.link
      list_node.link = nil
      node
    else
      pop(list_node.link)
    end
  end

  def count(list_node = head)
    if list_node.nil?
      0
    else
      1 + count(list_node.link)
    end
  end

  def tail(list_node = head)
    if list_node.nil? || list_node.link.nil?
      list_node
    else
      tail(list_node.link)
    end
  end

# find_by_index
  def [](index, list_node = head)
    if index == 0
      list_node
    elsif index < count
      self.[](index - 1, list_node.link)
    end
  end

  def find_by_value(data, list_node = head)
    if list_node.data == data
      0
    else
      1 + find_by_value(data, list_node.link)
    end
  end

  def remove_by_index(index, list_node = head)
    if index > count
      nil
    elsif index == 0
      node = head
      self.head = head.link
      node
    elsif index == 1 && list_node
      node = list_node.link
      list_node.link = list_node.link.link
      node
    else
      remove_by_index(index - 1, list_node.link)
    end
  end

  def remove_by_value(data, list_node = head)
    if head.data == data
      node = head
      self.head = head.link
      node
    elsif list_node.link.data == data
      node = list_node.link
      list_node.link = list_node.link.link
      node
    else
      remove_by_value(data, list_node.link)
    end
  end

  def distance(value1, value2)
    find_by_value(value2) - find_by_value(value1)
  end

  def reverse(list_node = head, calls = 0)
    old_head = head
    first_node = list_node.link
    second_node = list_node
    more = list_node.link.link

    first_node.link = second_node
    self.head = first_node

    second_node.link = (calls == 0 ? nil : old_head)

    reverse(more, calls += 1) unless more.nil?
  end
end
