gem 'minitest'
require 'minitest/autorun'
require './vertex'
require './edge'
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

    # Reads lines from files and arranges them in arrays of Strings
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

    assert_equal [1, 2, 3, 4], g.V.keys
    assert_equal [1, 2, 3, 4, 5], g.E.keys

    vertex_edges.each do |key, values|
      edge_ids = []
      values.each do |edge|
        edge_ids << edge.id
      end
      assert_equal g.vertex_edges[key], edge_ids  # ids should be equal
    end

    # Test case 2, using @b
    Vertex.next_id = 1
    Edge.next_id = 1
    vertex_edges = Graph.build_adjacency_list(@b)
    g = Graph.new(vertex_edges)

    assert_equal 8, g.n
    assert_equal 14, g.m

    assert_equal [1, 2, 3, 4, 5, 6, 7, 8], g.V.keys
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], g.E.keys

    vertex_edges.each do |key, values|
      edge_ids = []
      values.each do |edge|
        edge_ids << edge.id
      end
      assert_equal g.vertex_edges[key], edge_ids  # ids should be equal
    end
  end

  # Tests that merge method works as expected.
  def test_merge!

    # Test case 1, using @a
    Vertex.next_id = 1
    Edge.next_id = 1
    vertex_edges = Graph.build_adjacency_list(@a)
    g = Graph.new(vertex_edges)

    # Takes and merges edge with id 2
    edge = g.E[2]
    pointed_edges = []  # Builds expected pointed_edges
    pointed_edges += g.vertex_edges[edge.v_id]
    pointed_edges += g.vertex_edges[edge.w_id]
    pointed_edges.delete(edge.id)

    g.merge!(edge.id)

    assert_equal 3, g.n
    assert_equal 4, g.m

    assert_equal [2, 4, 5], g.V.keys  # Vertices 1,3 should've been merged into 5
    assert_equal [1, 3, 4, 5], g.E.keys  # Edge 2 shouldn't exist now

    # Edge 2 should not be present for any vertex
    g.vertex_edges.each do |key, values|
      assert_equal true, !g.vertex_edges[key].include?(edge.id)
    end

    # Edges that were pointed by merged vertices now should be pointed by the 
    # new vertex (id 5)
    assert_equal nil, g.vertex_edges[edge.v_id]
    assert_equal nil, g.vertex_edges[edge.w_id]
    pointed_edges.each do |e_id|
      assert_equal true, g.vertex_edges[5].include?(e_id)
    end

    # ...now take and merge edge with id 1
    edge = g.E[1]
    pointed_edges = []  # Builds expected pointed_edges
    pointed_edges += g.vertex_edges[edge.v_id]
    pointed_edges += g.vertex_edges[edge.w_id]
    pointed_edges.delete(edge.id)
    pointed_edges.uniq!

    g.merge!(edge.id)

    assert_equal 2, g.n
    assert_equal 3, g.m

    assert_equal [4, 6], g.V.keys  # Vertices 5,2 should've been merged into 6
    assert_equal [3, 4, 5], g.E.keys  # Edge 1 shouldn't exist now

    # Edge 1 should not be present for any vertex
    g.vertex_edges.each do |key, values|
      assert_equal true, !g.vertex_edges[key].include?(edge.id)
    end

    # Edges that were pointed by merged vertices now should be pointed by the
    # new vertex (id 6)
    assert_equal nil, g.vertex_edges[edge.v_id]
    assert_equal nil, g.vertex_edges[edge.w_id]
    pointed_edges.each do |e_id|
      assert_equal true, g.vertex_edges[6].include?(e_id)
    end
  end

  # Tests that remove_self_loops method works as expected.
  def test_remove_self_loops
    # TODO: Write test.
  end
end