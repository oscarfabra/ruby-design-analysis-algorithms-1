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

    # Test case 1, using @a
    Vertex.next_id = 1
    Edge.next_id = 1
    vertex_edges = Graph.build_adjacency_list(@a)

    # Asserts number of adjacent edges for each id
    assert_equal 2, vertex_edges[1].size
    assert_equal 3, vertex_edges[2].size
    assert_equal 3, vertex_edges[3].size
    assert_equal 2, vertex_edges[4].size

    # Verifies adjacency lists with pre-calculated edge ids
    edge_ids = []
    vertex_edges[1].each { |e| edge_ids << e.id }
    assert_equal [1, 2], edge_ids

    edge_ids = []
    vertex_edges[2].each { |e| edge_ids << e.id }
    assert_equal [1, 3, 4], edge_ids

    edge_ids = []
    vertex_edges[3].each { |e| edge_ids << e.id }
    assert_equal [2, 3, 5], edge_ids

    edge_ids = []
    vertex_edges[4].each { |e| edge_ids << e.id }
    assert_equal [4, 5], edge_ids

    # Test case 2, using @b
    Vertex.next_id = 1
    Edge.next_id = 1
    vertex_edges = Graph.build_adjacency_list(@b)

    # Asserts number of adjacent edges for each id
    assert_equal 4, vertex_edges[1].size
    assert_equal 3, vertex_edges[2].size
    assert_equal 3, vertex_edges[3].size
    assert_equal 4, vertex_edges[4].size
    assert_equal 4, vertex_edges[5].size
    assert_equal 3, vertex_edges[6].size
    assert_equal 4, vertex_edges[7].size
    assert_equal 3, vertex_edges[8].size

    # Verifies adjacency lists with pre-calculated edge ids
    edge_ids = []
    vertex_edges[1].each { |e| edge_ids << e.id }
    assert_equal [1, 2, 3, 4], edge_ids

    edge_ids = []
    vertex_edges[2].each { |e| edge_ids << e.id }
    assert_equal [1, 5, 6], edge_ids

    edge_ids = []
    vertex_edges[3].each { |e| edge_ids << e.id }
    assert_equal [2, 5, 7], edge_ids

    edge_ids = []
    vertex_edges[4].each { |e| edge_ids << e.id }
    assert_equal [3, 6, 7, 8], edge_ids

    edge_ids = []
    vertex_edges[5].each { |e| edge_ids << e.id }
    assert_equal [8, 9, 10, 11], edge_ids

    edge_ids = []
    vertex_edges[6].each { |e| edge_ids << e.id }
    assert_equal [9, 12, 13], edge_ids

    edge_ids = []
    vertex_edges[7].each { |e| edge_ids << e.id }
    assert_equal [4, 10, 12, 14], edge_ids

    edge_ids = []
    vertex_edges[8].each { |e| edge_ids << e.id }
    assert_equal [11, 13, 14], edge_ids
  end

  # Tests that initialize method works as expected.
  def test_initialize

    # Test case 1, using @a
    Vertex.next_id = 1
    Edge.next_id = 1
    vertex_edges = Graph.build_adjacency_list(@a)
    g = Graph.new(vertex_edges)

    assert_equal 4, g.n
    assert_equal 5, g.m

    vertex_ids = []
    g.V.each { |v| vertex_ids << v.id }
    assert_equal [1, 2, 3, 4], vertex_ids

    edge_ids = []
    g.E.each { |e| edge_ids << e.id }
    assert_equal [1, 2, 3, 4, 5], edge_ids

    assert_equal vertex_edges, g.vertex_edges

    # Test case 2, using @b
    Vertex.next_id = 1
    Edge.next_id = 1
    vertex_edges = Graph.build_adjacency_list(@b)
    g = Graph.new(vertex_edges)

    assert_equal 8, g.n
    assert_equal 14, g.m

    vertex_ids = []
    g.V.each { |v| vertex_ids << v.id }
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8], vertex_ids

    edge_ids = []
    g.E.each { |e| edge_ids << e.id }
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], edge_ids

    assert_equal vertex_edges, g.vertex_edges
  end

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