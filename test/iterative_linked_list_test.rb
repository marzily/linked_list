require './test/test_helper'

class IterativeLinkedListTest < Minitest::Test
  def setup
    @list = IterativeLinkedList.new
  end

  def test_it_has_a_head
    assert_nil @list.head
  end

  def test_it_appends_a_node_to_an_empty_list
    @list.append(Node.new(:blue))

    assert_equal :blue, @list.head.data
    assert_nil @list.head.link
  end

  def test_it_appends_a_node_to_a_one_element_list
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))

    assert_equal :blue, @list.head.data
    assert_equal :red, @list.head.link.data
    assert_nil @list.head.link.link
  end

  def test_it_appends_a_node_to_a_multi_element_list
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))
    @list.append(Node.new(:yellow))

    assert_equal :blue, @list.head.data
    assert_equal :red, @list.head.link.data
    assert_equal :yellow, @list.head.link.link.data
    assert_nil @list.head.link.link.link
  end

  def test_it_prepends_node_to_an_empty_list
    @list.prepend(Node.new(:red))

    assert_equal :red, @list.head.data
    assert_nil @list.head.link
  end

  def test_it_prepends_node_to_single_element_list
    @list.append(Node.new(:blue))
    @list.prepend(Node.new(:red))

    assert_equal :red, @list.head.data
    assert_equal :blue, @list.head.link.data
    assert_nil @list.head.link.link
  end

  def test_it_prepends_node_to_multi_element_list
    @list.append(Node.new(:blue))
    @list.append(Node.new(:yellow))
    @list.prepend(Node.new(:red))

    assert_equal :red, @list.head.data
    assert_equal :blue, @list.head.link.data
    assert_equal :yellow, @list.head.link.link.data
    assert_nil @list.head.link.link.link
  end

  def test_it_inserts_node_into_empty_list
    @list.insert(Node.new(:blue), 0)

    assert_equal :blue, @list.head.data
  end

  def test_it_inserts_node_at_end_of_list
    @list.insert(Node.new(:blue), 0)
    @list.insert(Node.new(:red), 1)

    assert_equal :blue, @list.head.data
    assert_equal :red, @list.head.link.data
  end

  def test_it_inserts_node_at_appropriate_index
    @list.insert(Node.new(:blue), 0)
    @list.insert(Node.new(:red), 1)
    @list.insert(Node.new(:yellow), 1)

    assert_equal :blue, @list.head.data
    assert_equal :yellow, @list.head.link.data
    assert_equal :red, @list.head.link.link.data

    @list.insert(Node.new(:green), 2)

    assert_equal :blue, @list.head.data
    assert_equal :yellow, @list.head.link.data
    assert_equal :green, @list.head.link.link.data
    assert_equal :red, @list.head.link.link.link.data
  end

  def test_it_returns_false_if_data_not_in_single_element_list
    @list.append(Node.new(:blue))

    refute @list.includes?(:green)
  end

  def test_it_returns_false_if_data_not_in_two_element_list
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))

    refute @list.includes?(:green)
  end

  def test_it_returns_true_if_data_in_two_element_list
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))

    assert @list.includes?(:red)
  end

  def test_it_returns_false_if_data_not_in_multi_element_list
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))
    @list.append(Node.new(:yellow))

    refute @list.includes?(:green)
  end

  def test_it_returns_true_if_data_in_multi_element_list
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))
    @list.append(Node.new(:yellow))

    assert @list.includes?(:yellow)
  end

  def test_it_returns_nil_from_an_empty_list
    assert_nil @list.pop
  end

  def test_it_returns_element_from_a_one_element_list
    @list.append(Node.new(:blue))

    assert_equal :blue, @list.pop.data
    assert_nil @list.head
  end

  def test_it_returns_last_element_from_a_two_element_list
    @list.append(Node.new(:red))
    @list.append(Node.new(:yellow))

    assert_equal :yellow, @list.pop.data
    assert_equal :red, @list.head.data
    assert_nil @list.head.link
  end

  def test_it_returns_last_element_from_a_multi_element_list
    @list.append(Node.new(:red))
    @list.append(Node.new(:yellow))
    @list.append(Node.new(:blue))

    assert_equal :blue, @list.pop.data
    assert_equal :red, @list.head.data
    assert_equal :yellow, @list.head.link.data
    assert_nil @list.head.link.link
  end

  def test_count_is_0_when_the_list_is_empty
    assert_equal 0, @list.count
  end

  def test_count_is_1_when_list_has_one_node
    @list.append(Node.new(:blue))

    assert_equal 1, @list.count
  end

  def test_count_is_2_when_list_has_two_nodes
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))

    assert_equal 2, @list.count
  end

  def test_it_can_access_the_tail_of_an_empty_list
    assert_nil @list.tail
  end

  def test_it_can_access_the_tail_of_a_one_element_list
    @list.append(Node.new(:blue))

    assert_equal :blue, @list.tail.data
  end

  def test_it_can_access_the_tail_of_a_multi_element_list
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))

    assert_equal :red, @list.tail.data
  end

  def test_it_returns_nil_from_an_empty_list
    assert_nil @list[0]
  end

  def test_it_accesses_element_from_a_one_element_list
    @list.append(Node.new(:yellow))

    assert_equal :yellow, @list[0].data
  end

  def test_it_can_access_element_at_any_index
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))
    @list.append(Node.new(:yellow))

    assert_equal :blue, @list[0].data
    assert_equal :red, @list[1].data
    assert_equal :yellow, @list[2].data
  end

  def test_it_returns_nil_when_index_is_out_of_range
    @list.append(Node.new(:yellow))

    assert_nil @list[1]
    assert_nil @list[2]
  end

  def test_it_finds_first_index_of_value
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))
    @list.append(Node.new(:yellow))

    assert_equal 1, @list.find_by_value(:red)
    assert_equal 2, @list.find_by_value(:yellow)
  end

  def test_it_removes_a_node_by_index_from_middle_of_list
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))
    @list.append(Node.new(:yellow))
    @list.append(Node.new(:green))

    assert_equal :yellow, @list.remove_by_index(2).data
    assert_equal :blue, @list.head.data
    assert_equal :red, @list.head.link.data
    assert_equal :green, @list.head.link.link.data
  end

  def test_it_returns_nil_if_index_is_out_of_range
    @list.append(Node.new(:blue))

    assert_nil @list.remove_by_index(3)
  end
  def test_it_removes_a_node_by_index_from_end_of_list
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))
    @list.append(Node.new(:green))

    assert_equal :green, @list.remove_by_index(2).data
    assert_equal :blue, @list.head.data
    assert_equal :red, @list.head.link.data
  end

  def test_it_removes_a_node_by_content
    @list.append(Node.new(:yellow))
    @list.append(Node.new(:blue))

    assert_equal :blue, @list.remove_by_value(:blue).data
    assert_equal :yellow, @list.head.data
    assert_nil @list.head.link
  end

  def test_it_only_removes_first_occurence
    @list.append(Node.new(:yellow))
    @list.append(Node.new(:yellow))
    @list.append(Node.new(:yellow))

    @list.remove_by_value(:yellow)

    assert_equal :yellow, @list.head.data
    assert_equal :yellow, @list.head.link.data
    assert_nil @list.head.link.link
  end

  def test_it_only_removes_first_occurence_from_multi_element_list
    @list.append(Node.new(:blue))
    @list.append(Node.new(:red))
    @list.append(Node.new(:yellow))
    @list.append(Node.new(:green))

    assert_equal :yellow, @list.remove_by_value(:yellow).data
    assert_equal :blue, @list.head.data
    assert_equal :red, @list.head.link.data
    assert_equal :green, @list.head.link.link.data
  end

  # def test_it_finds_the_distance_between_two_nodes
  #   @list.append(Node.new(:blue))
  #   @list.append(Node.new(:red))
  #   @list.append(Node.new(:yellow))
  #   @list.append(Node.new(:green))
  #
  #   assert_equal 3, @list.distance(:blue, :green)
  # end
end
