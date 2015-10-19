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

  # def recursive_pop(node)
  #   prev = node
  #   current = node.link
  #
  #   if current.link.nil?
  #     prev.link = nil
  #     return current
  #   end
  #
  #   recursive_pop(current.link)
  # end
  #
  # def pop
  #   return if head.nil?
  #
  #   if count == 1
  #     node = head
  #     self.head = nil
  #     node
  #   else
  #     recursive_pop(head)
  #   end
  # end
  #
  # def recursive_find_index(node, index)
  #   return node if index == 0
  #   recursive_find_index(node.link, index - 1)
  # end
  #
  # def [](index)
  #   return if index > (count - 1)
  #   recursive_find_index(head, index)
  # end
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
