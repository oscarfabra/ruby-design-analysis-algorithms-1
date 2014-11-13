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
    # TODO: Initialize values.
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

  # Tests that clone method works as expected.
  def test_clone
    # TODO: Write method.
  end

  # Tests that include? method works as expected.
  def test_include?
    # TODO: Write method.
  end

  # Tests that merge_vertices method works as expected.
  def test_merge_vertices
    # TODO: Write method.
  end
end