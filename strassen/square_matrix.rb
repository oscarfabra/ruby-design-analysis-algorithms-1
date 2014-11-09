#------------------------------------------------------------------------------
# :section: square_matrix.rb
# SquareMatrix represents a 2-D array with a (possibly) very large number of
# rows and columns.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 07/11/2014
#------------------------------------------------------------------------------
class SquareMatrix

  # Class Constants
  UPPER_LEFT_CORNER = 1
  UPPER_RIGHT_CORNER = 2
  LOWER_LEFT_CORNER = 3
  LOWER_RIGHT_CORNER = 4

  # Integer 2-D array in which to store the values
  attr_reader :table

  # Size of a side of the SquareMatrix
  attr_reader :n

  # Creates a new SquareMatrix. Params:
  # +n+:: Size of a side of the SquareMatrix.
  # +table+:: [Optional] +Array+ of numbers with the table for SquareMatrix.
  def initialize(n, table = nil)
    @n = n
    if table == nil
      @table = Array.new(n) { |i| i = Array.new(n) }
    else
      @table = Array.new(table)
    end
  end

  # Gets the sub-SquareMatrix that corresponds to the given quarter id. Returns 
  # the corresponding SquareMatrix.
  # +quarter+:: Id of the n/2 * n/2 quarter to get. Could be any of the four 
  # class constants.
  def get_sub_square_matrix(quarter)
    if quarter != UPPER_LEFT_CORNER && quarter != UPPER_RIGHT_CORNER && 
      quarter != LOWER_LEFT_CORNER && quarter != LOWER_RIGHT_CORNER
      raise ArgumentError, "Invalid quarter argument."        
    end

    row = 0
    col = 0
    r = (@n % 2 == 1)? 1 : 0   # Whether n is odd
    
    case quarter
    when UPPER_LEFT_CORNER
      row = 0; col = 0
    when UPPER_RIGHT_CORNER
      row = 0; col = @n/2 + r # Bigger quarters will be the ones on the left...
    when LOWER_LEFT_CORNER
      row = @n/2 + r; col = 0
    when LOWER_RIGHT_CORNER
      row = @n/2 + r; col = @n/2 + r  #...and the upper positions
    end

    # Obtains the corresponding SquareMatrix of the given quarter
    table = Array.new
    (row...row + @n/2 + r).each do |i|
      table[i - row] = Array.new(@n/2 + r)
      (col...col + @n/2 + r).each do |j|
        table[i - row][j - col] = @table[i][j]  # this table at indices i, j
      end
    end
    SquareMatrix.new(@n/2 + r, table)  # Returns the SquareMatrix
  end

  # Puts the given SquareMatrix in the given quarter id of this SquareMatrix.
  # +x+:: SquareMatrix to put. Should be of size n/2 * n/2.
  # +quarter+:: 
  def put_sub_square_matrix(x, quarter)
    if x.n != @n/2
      raise ArgumentError, "Given SquareMatrix should have dimensions n/2 * n/2"
    elsif quarter != UPPER_LEFT_CORNER && quarter != UPPER_RIGHT_CORNER && 
      quarter != LOWER_LEFT_CORNER && quarter != LOWER_RIGHT_CORNER
      raise ArgumentError, "Invalid quarter argument."        
    end

    row = 0; col = 0
    r = (@n % 2 == 1)? 1 : 0   # Whether n is odd
    
    case quarter
    when UPPER_LEFT_CORNER
      row = 0; col = 0
    when UPPER_RIGHT_CORNER
      row = 0; col = @n/2 + r # Bigger quarters will be the ones on the left...
    when LOWER_LEFT_CORNER
      row = @n/2 + r; col = 0
    when LOWER_RIGHT_CORNER
      row = @n/2 + r; col = @n/2 + r  #...and the upper positions
    end

    # Puts the corresponding values of x in the given quarter of this table
    (row...row + @n/2 + r).each do |i|
      @table[i] = Array.new(@n/2 + r) if @table[i] == nil
      (col...col + @n/2 + r).each do |j|
        @table[i][j] = x.table[i - row][j - col]  # given table at indices i, j
      end
    end
  end

  # Returns a +String+ representation of this SquareMatrix.
  def to_str
    string = ""
    table.each do |row|
      string += row.map(&:to_s).join(" ").strip + "\n"
    end
    string
  end

  class << self   # Class methods

    # Reads an array of lines with the representation of a SquareMatrix and
    # returns it. Params:
    # +lines+:: +Array+ of +String+ objects with the representation of a 
    # SquareMatrix.
    # +lb+:: Lower-bound index of lines to begin to read the SquareMatrix.
    # +n+:: Size of a side of the SquareMatrix.
    def read_square_matrix(lines, lb, n)
      table = Array.new
      lines[lb...lb + n].each do |line|
        table << line.split(" ").map { |s| s.to_i }
      end
      SquareMatrix.new(n, table)  # Returns the SquareMatrix
    end

    # Multiplies two SquareMatrix objects and returns the product.
    def multiply(x, y)
      
    end

    # Sums up two SquareMatrix objects and returns the resulting SquareMatrix.
    def add(x, y)
      if x.n != y.n
        raise ArgumentError, "The two SquareMatrix objects should be the same size."
      end
      # Adds the two SquareMatrix objects
      table = Array.new
      (0...x.n).each do |i|
        table[i] = []
        (0...x.n).each do |j|
          table[i][j] = x.table[i][j] + y.table[i][j]
        end
      end
      SquareMatrix.new(x.n, table)
    end

    # Subtracts the two SquareMatrix objects and returns the result.
    def subtract(x, y)
      if x.n != y.n
        raise ArgumentError, "The two SquareMatrix objects should be the same size."
      end
      # Adds the two SquareMatrix objects
      table = Array.new
      (0...x.n).each do |i|
        table[i] = []
        (0...x.n).each do |j|
          table[i][j] = x.table[i][j] - y.table[i][j]
        end
      end
      SquareMatrix.new(x.n, table)  # Returns the SquareMatrix
    end

    #private   # Private class methods

      # Multiplies the two given SquareMatrix objects and returns the result.
      def strassens_multiplication(x, y, n)
        if n == 2
          m = SquareMatrix.new(n)
          m.table[0][0] = x.table[0][0] * y.table[0][0] + x.table[0][1] * y.table[1][0]
          m.table[0][1] = x.table[0][0] * y.table[0][1] + x.table[0][1] * y.table[1][1]
          m.table[1][0] = x.table[1][0] * y.table[0][0] + x.table[1][1] * y.table[1][0]
          m.table[1][1] = x.table[1][0] * y.table[0][1] + x.table[1][1] * y.table[1][1]
          m
        end

          # Gets sub-SquareMatrix objects
          a = x.get_sub_square_matrix(SquareMatrix::UPPER_LEFT_CORNER)
          b = x.get_sub_square_matrix(SquareMatrix::UPPER_RIGHT_CORNER)
          c = x.get_sub_square_matrix(SquareMatrix::LOWER_LEFT_CORNER)
          d = x.get_sub_square_matrix(SquareMatrix::LOWER_RIGHT_CORNER)
          e = y.get_sub_square_matrix(SquareMatrix::UPPER_LEFT_CORNER)
          f = y.get_sub_square_matrix(SquareMatrix::UPPER_RIGHT_CORNER)
          g = y.get_sub_square_matrix(SquareMatrix::LOWER_LEFT_CORNER)
          h = y.get_sub_square_matrix(SquareMatrix::LOWER_RIGHT_CORNER)

          # Recursively computes the 7 products
          p1 = strassens_multiplication(a, subtract(f,h), n/2)
          p2 = strassens_multiplication(add(a,b), h, n/2)
          p3 = strassens_multiplication(add(c,d), e, n/2)
          p4 = strassens_multiplication(d, subtract(g,e), n/2)
          p5 = strassens_multiplication(add(a,d), add(e,h), n/2)
          p6 = strassens_multiplication(subtract(b,d), add(g,h), n/2)
          p7 = strassens_multiplication(subtract(a,c), add(e,f), n/2)

          compute_products(p1, p2, p3, p4, p5, p6, p7, n)
      end

      # Computes the 7 products according to Strassen's Algorithm and returns
      # the resulting matrix.
      def compute_products(p1, p2, p3, p4, p5, p6, p7, n)
        m = SquareMatrix.new(n)
        m.put_sub_square_matrix(subtract(add(add(p5,p4),p6),p2), 
          UPPER_LEFT_CORNER)
        m.put_sub_square_matrix(add(p1, p2), UPPER_RIGHT_CORNER)
        m.put_sub_square_matrix(add(p3, p4), LOWER_LEFT_CORNER)
        m.put_sub_square_matrix(subtract(subtract(add(p1,p5),p3),p7), 
          LOWER_RIGHT_CORNER)
        m
      end
  end  # Ends class methods

end  # Ends class