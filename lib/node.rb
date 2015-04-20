class Node
  # A single node for either list type
  attr_accessor :link
  attr_reader :data

  def initialize(data)
    @data = data
    @link = nil
  end

end


class RecursiveLinkedList
  # A list using Recursive approaches
end
