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

  # def test_count_is_0_when_the_list_is_empty
  #   assert_equal 0, @list.count
  # end
  #
  # def test_count_is_1_when_list_has_one_node
  #   @list.append(Node.new(:blue))
  #
  #   assert_equal 1, @list.count
  # end
  #
  # def test_count_is_2_when_list_has_two_nodes
  #   @list.append(Node.new(:blue))
  #   @list.append(Node.new(:red))
  #
  #   assert_equal 2, @list.count
  # end
  #
  # def test_it_can_access_the_tail_of_an_empty_list
  #   assert_nil @list.tail
  # end
  #
  # def test_it_can_access_the_tail_of_a_one_element_list
  #   @list.append(Node.new(:blue))
  #
  #   assert_equal :blue, @list.tail.data
  # end
  #
  # def test_it_can_access_the_tail_of_a_multi_element_list
  #   @list.append(Node.new(:blue))
  #   @list.append(Node.new(:red))
  #
  #   assert_equal :red, @list.tail.data
  # end
  #
  # def test_it_returns_nil_from_the_end_of_an_empty_list
  #   assert_nil @list.pop
  # end
  #
  # def test_it_returns_element_from_the_end_of_a_one_element_list
  #   @list.append(Node.new(:blue))
  #
  #   assert_equal :blue, @list.pop.data
  #   assert_nil @list.head
  # end
  #
  # def test_it_returns_last_element_from_the_end_of_a_multi_element_list
  #   @list.append(Node.new(:red))
  #   @list.append(Node.new(:yellow))
  #
  #   assert_equal :yellow, @list.pop.data
  #   assert_equal :red, @list.head.data
  #   assert_nil @list.head.link
  # end
  #
  # def test_it_accesses_nil_from_an_empty_list
  #   assert_nil @list[0]
  # end
  #
  # def test_it_accesses_element_from_a_one_element_list
  #   @list.append(Node.new(:yellow))
  #
  #   assert_equal :yellow, @list[0].data
  # end
  #
  # def test_it_can_access_element_at_any_index
  #   @list.append(Node.new(:blue))
  #   @list.append(Node.new(:red))
  #   @list.append(Node.new(:yellow))
  #
  #   assert_equal :blue, @list[0].data
  #   assert_equal :red, @list[1].data
  #   assert_equal :yellow, @list[2].data
  # end
  #
  # def test_it_returns_nil_when_index_is_out_of_range
  #   @list.append(Node.new(:yellow))
  #
  #   assert_nil @list[1]
  #   assert_nil @list[2]
  # end
  #
  # def test_it_removes_nil_from_the_front_of_an_empty_list
  #   assert_nil @list.shift
  # end
  #
  # def test_it_removes_first_element_from_a_one_element_list
  #   @list.append(Node.new(:yellow))
  #
  #   assert_equal :yellow, @list.shift.data
  #   assert_nil @list.head
  # end
  #
  # def test_it_removes_first_elements_from_the_front_of_a_multi_element_list
  #   @list.append(Node.new(:yellow))
  #   @list.append(Node.new(:red))
  #
  #   assert_equal :yellow, @list.shift.data
  # end
  #
  # def test_it_resets_the_list_after_shifting
  #   @list.append(Node.new(:yellow))
  #   @list.append(Node.new(:red))
  #   @list.shift.data
  #
  #   assert_equal :red, @list.head.data
  #   assert_nil @list.head.link
  # end
  #
  # def test_it_correctly_shifts_from_a_multi_element_list
  #   @list.append(Node.new(:yellow))
  #   @list.append(Node.new(:red))
  #   @list.append(Node.new(:blue))
  #
  #   assert_equal :yellow, @list.shift.data
  #   assert_equal :red, @list.head.data
  #   assert_equal :blue, @list.head.link.data
  #   assert_nil @list.head.link.link
  # end
  #
  # def test_it_unshifts_an_element_to_the_front_of_an_empty_list
  #   @list.unshift(Node.new(:blue))
  #
  #   assert_equal :blue, @list.head.data
  # end
  #
  # def test_it_unshifts_an_element_to_the_front_of_a_one_item_list
  #   @list.unshift(Node.new(:blue))
  #   @list.unshift(Node.new(:yellow))
  #
  #   assert_equal :yellow, @list.head.data
  #   assert_equal :blue, @list.head.link.data
  #   assert_nil @list.head.link.link
  # end
  #
  # def test_it_unshifts_an_element_to_the_front_of_a_multi_item_list
  #   @list.unshift(Node.new(:blue))
  #   @list.unshift(Node.new(:yellow))
  #   @list.unshift(Node.new(:red))
  #
  #   assert_equal :red, @list.head.data
  #   assert_equal :yellow, @list.head.link.data
  #   assert_equal :blue, @list.head.link.link.data
  #   assert_nil @list.head.link.link.link
  # end
  #
  # def test_it_removes_the_first_occurance_of_an_element
  #   skip
  #   @list.unshift(Node.new(:blue))
  #   @list.unshift(Node.new(:yellow))
  #   @list.unshift(Node.new(:red))
  #
  #   assert_equal :yellow, @list.delete(:yellow).data
  #   assert_equal :red, @list.head.data
  #   assert_equal :blue, @list.head.link.data
  #   assert_equal nil, @list.head.link.link
  # end
  #
  # def test_it_removes_all_occurrances_of_an_element
  #   @list.unshift(Node.new(:blue))
  #   @list.unshift(Node.new(:yellow))
  #   @list.unshift(Node.new(:red))
  #   @list.unshift(Node.new(:blue))
  #
  #   assert_equal :blue, @list.delete(:blue).data
  #
  #   @list
  #
  #
  # end

end
