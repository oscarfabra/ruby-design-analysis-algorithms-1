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
    @n = @lines.shift   # Gets and removes first element from array
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
    # puts "n = #{@n}"
    # puts "#{@lines}"
    # x = SquareMatrix.read_square_matrix(0, @n, lines)
  end

  # Tests that to_str method works as expected.
  def to_str
    
  end

  # Tests that add method works as expected.
  def test_add

  end

  # Tests that subtract method works as expected.
  def test_subtract

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