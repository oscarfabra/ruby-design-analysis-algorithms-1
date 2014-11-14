gem 'minitest'
require 'minitest/autorun'
require './vertex'

#------------------------------------------------------------------------------
# :section: vertex_test.rb
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

  # Tests that add method works as expected.
  def test_add
    a = Vertex.new
    b = Vertex.new
    c = Vertex.new

    a.add(b)
    assert_equal [2], a.bag

    a.add(c)
    assert_equal [2, 3], a.bag    
  end

  # Tests that include? method works as expected.
  def test_include?
    a = Vertex.new
    b = Vertex.new
    c = Vertex.new

    a.add(b)
    assert_equal [2], a.bag
    assert_equal true, a.include?(1)  # Its own id
    assert_equal true, a.include?(2)  # ID of b
    assert_equal false, a.include?(3)  # Not included.

    a.add(c)
    assert_equal [2, 3], a.bag 
    assert_equal true, a.include?(1)  # Its own id
    assert_equal true, a.include?(2)  # ID of b
    assert_equal true, a.include?(3)  # ID of c
  end

    # Tests that merge method works as expected.
  def test_merge
    a = Vertex.new  # a.id should be 4
    b = Vertex.new  # b.id should be 5

    c = Vertex.merge(a, b)
    assert_equal 3, c.id
    assert_equal true, c.include?(1)
    assert_equal true, c.include?(2)
    assert_equal true, c.include?(3)
    assert_equal false, c.include?(4)

    d = Vertex.merge(c, a)
    assert_equal 4, d.id
    assert_equal true, d.include?(1)
    assert_equal true, d.include?(2)
    assert_equal true, d.include?(3)
    assert_equal true, d.include?(4)
  end

  # Tests that clone method works as expected.
  def test_clone
    a = Vertex.new
    b = Vertex.new
    c = Vertex.merge(a, b)
    d = Vertex.merge(c, a)

    c.clone(d)

    # All results should be the same for c and d
    assert_equal 4, c.id
    assert_equal true, c.include?(1)
    assert_equal true, c.include?(2)
    assert_equal true, c.include?(3)
    assert_equal 4, d.id
    assert_equal true, d.include?(1)
    assert_equal true, d.include?(2)
    assert_equal true, d.include?(3)
  end
end