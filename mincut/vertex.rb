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

  # Adds the id and bag of given Vertex to this object's bag array.
  def add(v)
    @bag << v.id
    @bag += bag
  end

  class << self   # Class methods.

    # Merges the given Vertex objects. Returns the new Vertex.
    def merge(v, w)
      vertex = Vertex.new
      vertex.add(v)
      vertex.add(w)
      vertex
    end

    # Assigns a value to next_id class variable (for testing purposes mainly).
    def next_id=(i)
      @@next_id = i
    end
  end  # Ends class methods

end  # Ends class