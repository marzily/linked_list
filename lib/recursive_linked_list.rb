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
    if list_node.link.nil?
      list_node.data == data
    else
      includes?(data, list_node.link)
    end
  end

  def pop(list_node = head)
    if head.nil?
      head
    elsif head.link.nil?
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
    elsif list_node.link.nil?
      1
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

  #
  # def delete(data, node = head)
  #   # empty? do nothing
  #   return if node.nil? #returns yellow
  #   if head.data == data
  #     self.head = head.link
  #   elsif node.link.data == data
  #     node.link = node.link.link
  #   else
  #     delete(data, node.link)
  #   end
  #   # current node has the data -- remove head by making head's neighbor the new head
  #   # otherwise move frame of reference to head's neighbor
  # end
  #
  # def delete_all(data, node = head)
  #   return if node.nil? #reached the end
  #   delete(data)
  #   # if head.data == data
  #   #   self.head = head.link
  #   # elsif node.link.data == data
  #   #   node.link = node.link.link
  #   # end
  #   delete_all(data, node.link)
  # end


end
