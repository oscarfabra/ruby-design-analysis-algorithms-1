gem 'minitest'
require 'minitest/autorun'
require './square_matrix'

#------------------------------------------------------------------------------
# :section: square_matrix_test.rb
# This class tests that SquareMatrix class works as expected. SquareMatrix
# solves the problem of multiplying two square matrices with a (possibly) very
# large number of rows and columns.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 07/11/2014
#------------------------------------------------------------------------------
class SquareMatrixTest < MiniTest::Test

  # Performs initializations for last, main test (sort)
  def setup
    # Reads lines from file with two square matrices of n x n dimensions. 
    # Archive should has the following format: First line must contain n, 
    # followed by the n x n numbers of the first matrix, then the n x n numbers
    # of the second matrix.
    @lines = read_lines("./data/sm_0_8.txt")
    @lb = 0
    @n = @lines.shift.to_i   # Gets and removes first element from the lines array
    @x = SquareMatrix.read_square_matrix(@lines, @lb, @n)
  end

  # Reads lines of given file and arranges them in an Array. Returns an array
  # of +String+ objects with the values for the problem. Throws exception if 
  # file couldn't be read.
  # Params:
  # +filename+:: Path relative to the file with the input for the problem.
  def read_lines(filename)
    lines = []
    open(filename) do |file|
      while line = file.gets
        lines << line
      end
      lines
    end
  rescue StandardError => ex
    # Throws exception if file couldn't be read
    raise ex.class, "File couldn't be read."
  end

  # Tests that initialize works well
  def test_initialize
    x = SquareMatrix.new(@n)

    assert_equal x.n, @n
    assert_equal x.class, SquareMatrix
  end

  # Tests that read_square_matrix method works as expected.
  def test_read_square_matrix
    x = SquareMatrix.read_square_matrix(@lines, 0, @n)

    # Creates auxiliary 2-D Array to compare with x.table
    x_table = Array.new
    @lines[0...@n].each do |line|
      x_table << line.split(" ").map { |s| s.to_i }
    end

    assert_equal x.n, @n
    assert_equal x.table, x_table

    lb = @lb + @n  # New lb for y
    y = SquareMatrix.read_square_matrix(@lines, lb, @n)

    # Creates auxiliary 2-D Array to compare with y.table
    y_table = Array.new
    @lines[lb...lb + @n].each do |line|
      y_table << line.split(" ").map { |s| s.to_i }
    end

    assert_equal y.n, @n
    assert_equal y.table, y_table
  end

  # Tests that to_str method works as expected.
  def test_to_str
    
    # Creates auxiliary string to compare with @x.to_str
    string = ""
    @lines[@lb...@n].each do |line|
      string += line
    end

    assert_equal @x.to_str, string
  end

  # Tests that add method works as expected.
  def test_add
    lb = @lb + @n

    y = SquareMatrix.read_square_matrix(@lines, lb, @n)
    z = SquareMatrix.add(@x, y)

    z_table = "3 5 10 3 12 5 15 7
7 11 11 7 9 10 9 16
3 9 9 5 14 17 9 1
5 7 13 2 12 4 9 7
15 4 14 12 9 11 11 4
6 8 4 6 7 13 6 13
5 12 10 11 10 11 13 5
8 12 7 9 10 7 10 13
"

    assert_equal z.to_str, z_table
  end

  # Tests that subtract method works as expected.
  def test_subtract
    lb = @lb + @n

    y = SquareMatrix.read_square_matrix(@lines, lb, @n)
    z = SquareMatrix.subtract(@x, y)

    z_table = "1 1 0 -1 4 3 3 -1
1 1 7 -3 1 4 -3 2
1 1 3 1 2 -1 9 -1
1 1 1 0 4 2 9 -1
1 2 -2 6 -3 1 3 -2
4 6 0 4 1 5 4 1
3 2 -4 7 -6 5 -5 3
4 2 -1 3 6 -1 0 1
"

    assert_equal z.to_str, z_table
  end

  # Tests that compute_products method works as expected.
  def test_compute_products
    
  end
  
  # Tests that get_sub_square_matrix method works as expected.
  def test_get_sub_square_matrix
    
  end
  
  # Tests that put_sub_square_matrix method works as expected.
  def test_put_sub_square_matrix
    
  end

  # Tests that strassens_multiplication method works as expected.
  def test_strassens_multiplication
    
  end

  # Tests that multiply (main) method works as expected.
  def test_multiply
    
  end
end