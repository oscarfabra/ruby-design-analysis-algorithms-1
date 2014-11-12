#------------------------------------------------------------------------------
# :section: vertex.rb
# Represents a vertex for the Graph class.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 11/11/2014
#------------------------------------------------------------------------------
class Vertex

  @@next_id = 1   # Tells which id to set next. Class variable.

  attr_reader :id  # Identifies a vertex unequivocally
  attr_reader :bag  # Collection of vertex ids

  # Initializes a new Vertex.
  def initialize
    @bag = Array.new
    @id = @@next_id
    @@next_id += 1
  end

  # Clones a given Vertex.
  def clone(vertex)
    @bag = Array.new(vertex.bag)
    @id = vertex.id
  end

  # Tells whether the current vertex includes the given vertex id.
  def include?(v_id)
    return true if v_id == @id
    @bag.each do |i|
      return true if i == v_id
    end
    return false
  end

  class << self   # Class methods.

    # Merges the vertices with given Vertex objects. Returns the new Vertex.
    def merge_vertices(v, w)
      vertex = Vertex.new
      vertex.bag += v.bag
      vertex.bag += w.bag
      vertex
    end
  end  # Ends class methods

end  # Ends class