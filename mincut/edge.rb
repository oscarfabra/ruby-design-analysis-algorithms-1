#------------------------------------------------------------------------------
# :section: edge.rb
# Represents an Edge for the Graph class.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 11/11/2014
#------------------------------------------------------------------------------
class Edge

  @@next_id = 1   # Tells which id to set next. Class variable.

  attr_reader :id  # Identifies an edge unequivocally
  attr_reader :v  # Id of initial vertex.
  attr_reader :w  # Id of final vertex.

  # Initializes a new Edge.
  def initialize
    # TODO: Write method.
  end
end  # Ends class