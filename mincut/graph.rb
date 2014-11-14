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

    # Builds the corresponding adjacency list from the given list of Strings.
    # Returns a hash with (key, value) pairs where key is the id of a vertex,
    # and value is an array of the ids of its adjacent edges.
    def build_adjacency_list(lines)
      adj = {}
      x = []  # List of edges already added 
      lines.each do |line|
        a = []
        a += line.split(" ").map { |s| s.to_i }
        key = a.shift  # Gets id of key vertex

        values = []
        a.each do |v_id|
          # Finds and returns edge if it exists.
          if (e = find_edge(x, key, v_id)) == nil
            e = Edge.new(key, v_id)
            x << e
          end
          values << e
        end

        adj[key] = values  # Adds values to key        
      end
      adj  # Returns the adjacency list
    end

    # Finds and returns edge with given endpoints from x taking into account 
    # that this is an undirected graph. Returns nil if not included.
    def find_edge(x, v_id, w_id)
      x.each do |e|
        return e if (e.v_id == v_id && e.w_id == w_id) || 
          (e.v_id == w_id && e.w_id == v_id)
      end
      nil
    end
  end  # Ends class methods

end  # Ends class