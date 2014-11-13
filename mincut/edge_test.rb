gem 'minitest'
require 'minitest/autorun'
require './edge'

#------------------------------------------------------------------------------
# :section: edge_test.rb
# This class tests that Edge class works as expected. Edge represents an edge
# of the Graph class.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 12/11/2014
#------------------------------------------------------------------------------
class EdgeTest < MiniTest::Test

  # Performs initializations for tests
  def setup
    # Nothing to do.
  end

  # Tests that initialize method works as expected.
  def test_initialize
    a = Edge.new(1, 2)
    b = Edge.new(2, 3)
    c = Edge.new(1, 3)

    # Values were correctly assigned and can be accessed
    assert_equal 1, a.v_id
    assert_equal 2, a.w_id
    assert_equal 2, b.v_id
    assert_equal 3, b.w_id
    assert_equal 1, c.v_id
    assert_equal 3, c.w_id

    # Id was correctly assigned and can be accessed
    assert_equal 1, a.id
    assert_equal 2, b.id
    assert_equal 3, c.id
  end
end