#------------------------------------------------------------------------------
# :section: edge.rb
# Represents an Edge for the undirected Graph class.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 11/11/2014
#------------------------------------------------------------------------------
class Edge

  @@next_id = 1   # Tells which id to set next. Class variable.

  attr_reader :id  # Identifies an edge unequivocally
  attr_reader :v_id  # Id of initial vertex.
  attr_reader :w_id  # Id of final vertex.

  # Initializes a new Edge.
  # +v_id+:: Id of one vertex.
  # +w_id+:: Id of the other vertex. 
  def initialize(v_id, w_id)
    @v_id = v_id
    @w_id = w_id
    @id = @@next_id
    @@next_id += 1
  end

  class << self  # Class methods

    # Assigns a value to next_id class variable (for testing purposes mainly).
    def next_id=(i)
      @@next_id = i
    end
  end
end  # Ends class