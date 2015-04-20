require './test/test_helper'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new(:blue)
  end

  def test_it_knows_its_own_data
    assert_equal :blue, @node.data
  end

  def test_it_knows_whether_it_has_a_link
    assert_equal nil, @node.link

    node1 = Node.new(:yellow)
    node1.link = @node
    assert_equal @node, node1.link
  end
end
