gem 'minitest'
require 'minitest/autorun'
#require './vertex'
#require './edge'
require './graph'

#------------------------------------------------------------------------------
# :section: graph_test.rb
# This class tests that Graph class works as expected.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 13/11/2014
#------------------------------------------------------------------------------
class GraphTest < MiniTest::Test

  # Performs initializations for tests
  def setup
    # Initializes class variables to 1 for each test.
    Vertex.next_id = 1
    Edge.next_id = 1

    # Reads lines from file and arranges them in an array of integers
    @a = read_lines("./data/MinCut_4_1.txt")
    @b = read_lines("./data/MinCut_8_1.txt")
    @c = read_lines("./data/MinCut_8_2.txt")
  end

  # Reads lines of given file and arranges them in a list. Returns a list of
  # +String+ objects with the values for the graph. Throws exception if file
  # couldn't be read.
  # Params:
  # +filename+:: Path relative to the file with the input for the problem.
  def read_lines(filename)
    lines = []
    open(filename) do |file|
      while line = file.gets
        lines << line
      end
      lines
    end
  rescue StandardError => ex
    # Throws exception if file couldn't be read
    raise ex.class, "File couldn't be read."
  end

  # Tests that build_adjacency_list method works as expected.
  def test_build_adjacency_list
    vertex_edges = Graph.build_adjacency_list(@a)

    # Asserts number of adjacent edges for each id
    assert_equal 2, vertex_edges[1].size
    assert_equal 3, vertex_edges[2].size
    assert_equal 3, vertex_edges[3].size
    assert_equal 2, vertex_edges[4].size

    # Verifies adjacency lists with pre-calculated edge ids
    edge_ids = []
    vertex_edges[1].each do |e|
      edge_ids << e.id
    end
    assert_equal [1, 2], edge_ids

    edge_ids = []
    vertex_edges[2].each do |e|
      edge_ids << e.id
    end
    assert_equal [1, 3, 4], edge_ids

    edge_ids = []
    vertex_edges[3].each do |e|
      edge_ids << e.id
    end
    assert_equal [2, 3, 5], edge_ids

    edge_ids = []
    vertex_edges[4].each do |e|
      edge_ids << e.id
    end
    assert_equal [4, 5], edge_ids
  end

  # Tests that initialize method works as expected.
  #def test_initialize
    # TODO: Write test.
    #assert_equal true, false
  #end

  # Tests that add method works as expected.
  #def test_get_vertex
    # TODO: Write test.
  #end

  # Tests that add method works as expected.
  #def test_get_adjacency_list
    # TODO: Write test.
  #end

  # Tests that merge method works as expected.
  #def test_merge_vertices
    # TODO: Write test.
  #end

  # Tests that remove_self_loops method works as expected.
  #def test_remove_self_loops
    # TODO: Write test.
  #end
end