#------------------------------------------------------------------------------
# :section: square_matrix.rb
# SquareMatrix represents a 2-D array with a (possibly) very large number of
# rows and columns.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 07/11/2014
#------------------------------------------------------------------------------
class SquareMatrix

  # Integer 2-D array in which to store the values
  attr_reader :table

  # Size of a side of the SquareMatrix
  attr_reader :n

  # Creates a new SquareMatrix. Params:
  # +n+:: Size of a side of the SquareMatrix.
  # +lines+:: [Optional] +Array+ of +String+ objects with the representation of
  # the SquareMatrix.
  def initialize(n, lines = [])
    @table = Array.new
    @n = n
  end

  # Gets the sub-SquareMatrix that corresponds to the given quarter id. Returns 
  # the corresponding SquareMatrix.
  def get_sub_square_matrix(x, s)
    
  end

  # Puts the given SquareMatrix in the given quarter id of this SquareMatrix.
  def put_sub_square_matrix(x, s)
    
  end

  # Returns a +String+ representation of this SquareMatrix.
  def to_str
    
  end

  class << self   # Class methods

    # Reads an array of lines with the representation of a SquareMatrix and
    # returns it. Params:
    # +lines+:: +Array+ of +String+ objects with the representation of a 
    # SquareMatrix.
    # +lb+::
    # +n+::
    def read_square_matrix(lines, lb, n)
      
    end

    # Multiplies two SquareMatrix objects and returns the product.
    def multiply(x, y)
      
    end

    # Sums up two SquareMatrix objects and returns the result.
    def add(x, y)
      
    end

    # Subtracts the two SquareMatrix objects and returns the result.
    def subtract(x, y)
      
    end

    private   # Private class methods

      # Multiplies the two given SquareMatrix objects and returns the result.
      def strassens_multiplication(x, y, n)
        
      end

      # Computes the 7 products according to Strassen's Algorithm and returns
      # the resulting matrix.
      def compute_products(p1, p2, p3, p4, p5, p6, p7, n)
        
      end
  end  # Ends class methods

end  # Ends class