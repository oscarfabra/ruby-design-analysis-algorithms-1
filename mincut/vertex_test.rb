gem 'minitest'
require 'minitest/autorun'
require './vertex'

#------------------------------------------------------------------------------
# :section: edge_test.rb
# This class tests that Vertex class works as expected. Vertex represents a
# vertex or node of the Graph class.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 12/11/2014
#------------------------------------------------------------------------------
class VertexTest < MiniTest::Test

  # Performs initializations for tests
  def setup
    # Initializes next_id class variable to 1 for each test.
    Vertex.next_id = 1
  end

  # Tests that initialize method works as expected.
  def test_initialize
    a = Vertex.new
    b = Vertex.new
    c = Vertex.new

    # Id was correctly assigned and can be accessed
    assert_equal 1, a.id
    assert_equal 2, b.id
    assert_equal 3, c.id

    # Bag was correctly created and can be accessed
    assert_equal [], a.bag
    assert_equal [], b.bag
    assert_equal [], c.bag
  end

    # Tests that merge_vertices method works as expected.
  def test_merge_vertices
    a = Vertex.new  # a.id should be 4
    b = Vertex.new  # b.id should be 5

    assert_equal [], a.bag
    assert_equal [], b.bag

    c = Vertex.merge(a, b)
    assert_equal 3, c.id  # @@next_id class variable continues growing
    #assert_equal [1, 2], c.bag

    d = Vertex.merge(c, a)
    assert_equal 4, d.id
    #assert_equal [1, 2, 3], d.bag
  end

  # Tests that clone method works as expected.
  def test_clone
    <<-DOC
    a = Vertex.new
    b = Vertex.new
    c = Vertex.merge(a, b)
    d = Vertex.merge(c, a)

    c.clone(d)
    assert_equal 4, c.id
    assert_equal [1, 2, 3], c.bag
    assert_equal 4, d.id
    assert_equal [1, 2, 3], d.bag
    DOC
  end

  # Tests that include? method works as expected.
  def test_include?
    # TODO: Write method.
  end
end