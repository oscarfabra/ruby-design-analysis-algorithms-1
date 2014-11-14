require './edge'
require './vertex'

#------------------------------------------------------------------------------
# :section: graph.rb
# Represents an undirected graph with n vertices and m edges. Class is 
# optimized for speed rather than memory.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 11/11/2014
#------------------------------------------------------------------------------
class Graph

  attr_reader :n  # Number of vertices
  attr_reader :m  # Number of edges
  attr_reader :V  # Maps vertex id's with their respective vertices
  attr_reader :E  # Maps edge id's with their respective edges
  attr_reader :vertex_edges  # Maps vertices with their adjacent edges

  # Initializes a new Graph object. 
  # *Pre:*:: Graph is connected (each vertex has at least one adjacent edge).
  # Params:
  # +vertex_edges+:: Hash with pairs (k, v) where k is the id of each vertex,
  # and v is an array of the ids of its adjacent edges.
  def initialize(vertex_edges)
    # Initializes the hash of vertices
    @n = vertex_edges.size
    @V = {}
    n.times do
      v = Vertex.new
      @V[v.id] = v
    end
    # Initializes vertex_edges Hash (same as given param but adding only edge 
    # ids instead of full Edge objects)
    @vertex_edges = {}
    vertex_edges.each do |key, values|
      @vertex_edges[key] = []
      values.each do |edge|
        @vertex_edges[key] << edge.id
      end
    end
    # Initializes the hash of edges
    @E = {}
    vertex_edges.each do |key, values|
      values.each do |edge|
        if Graph.find_edge(@E.values, edge.v_id, edge.w_id) == nil
          @E[edge.id] = edge
        end
      end
    end
    @m = @E.size
  end

  # Merges the endpoints of given edge into a single vertex and removes edge.
  # *Pre:*:: edge with given id is in @E.
  def merge!(edge_id)
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