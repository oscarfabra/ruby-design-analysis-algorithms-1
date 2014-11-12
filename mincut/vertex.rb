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
    # TODO: Write method.
  end

  # Clones a given Vertex.
  def clone(vertex)
    # TODO: Write method.
  end

  # Tells whether the current vertex includes the given vertex id.
  def include?(v_id)
    
  end

  class << self   # Class methods.

    # Merges the vertices with the given Vertex objects.
    def merge_vertices(v, w)
      # TODO: Write method.
    end
  end  # Ends class methods

end  # Ends class