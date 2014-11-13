require './edge'
require './vertex'

#------------------------------------------------------------------------------
# :section: graph.rb
# Represents an undirected graph with n vertices and m edges.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 11/11/2014
#------------------------------------------------------------------------------
class Graph

  attr_reader :n  # Number of vertices
  attr_reader :m  # Number of edges
  attr_reader :V  # Array of vertices
  attr_reader :E  # Array of edges
  attr_reader :vertex_edges  # Maps vertices with their adjacent edges

  # Initializes a new Graph object. Params:
  # +n+:: Number of vertices.
  # +vertex_edges+:: Hash with pairs (k, v) where k is the id of each vertex,
  # and v is an array of the ids of its adjacent edges.
  def initialize(n, vertex_edges)
    # TODO: Write method.
  end

  # Gets the edges incident to the given vertex.
  def get_incident_edges(v_id)
    # TODO: Write method.
  end

  # Gets the vertex with the given id.
  def get_vertex(v_id)
    # TODO: Write method.
  end

  # Merges the vertices with the given ids.
  def merge_vertices(v_id, w_id)
    # TODO: Write method.
  end

  # Removes self-loops of given vertex, if any.
  def remove_self_loops(v_id)
    # TODO: Write method.
  end

  class << self   # Class methods.

    # Gets the corresponding adjacency list from the given list of Strings.
    # Returns a hash with (key, value) pairs where key is the id of a vertex,
    # and value is an array of the ids of its adjacent edges.
    def get_adjacency_list(lines)
      # TODO: Write method.
    end
  end  # Ends class methods

end  # Ends class