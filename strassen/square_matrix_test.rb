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

  # Performs initializations for the tests.
  def setup
    # Reads lines from file with two square matrices of n x n dimensions. 
    # Archive should have the following format: First line must contain n, 
    # followed by the n x n numbers of the first matrix, then the n x n numbers
    # of the second matrix.
    @lines = read_lines("./data/sm_0_8.txt")
    @lb = 0
    @n = @lines.shift.to_i   # Gets and removes first element from lines array
    @x = SquareMatrix.read_square_matrix(@lines, @lb, @n)
  end

  # Reads lines of given file and arranges them in an +Array+. Returns an array
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

    assert_equal z_table, z.to_str
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

    assert_equal z_table, z.to_str
  end

  # Tests that get_sub_square_matrix method works as expected.
  def test_get_sub_square_matrix

    # Gets each of the quarters of SquareMatrix @x
    a = @x.get_sub_square_matrix(SquareMatrix::UPPER_LEFT_CORNER)
    b = @x.get_sub_square_matrix(SquareMatrix::UPPER_RIGHT_CORNER)
    c = @x.get_sub_square_matrix(SquareMatrix::LOWER_LEFT_CORNER)
    d = @x.get_sub_square_matrix(SquareMatrix::LOWER_RIGHT_CORNER)

    a_table = "2 3 5 1
4 6 9 2
2 5 6 3
3 4 7 1
"
    b_table = "8 4 9 3
5 7 3 9
8 8 9 0
8 3 9 3
"
    c_table = "8 3 6 9
5 7 2 5
4 7 3 9
6 7 3 6
"
    d_table = "3 6 7 1
4 9 5 7
2 8 4 4
8 3 5 7
"
    assert_equal a_table, a.to_str
    assert_equal b_table, b.to_str
    assert_equal c_table, c.to_str
    assert_equal d_table, d.to_str
  end
  
  # Tests that put_sub_square_matrix method works as expected.
  def test_put_sub_square_matrix

    # Gets each of the quarters of SquareMatrix @x
    a = @x.get_sub_square_matrix(SquareMatrix::UPPER_LEFT_CORNER)
    b = @x.get_sub_square_matrix(SquareMatrix::UPPER_RIGHT_CORNER)
    c = @x.get_sub_square_matrix(SquareMatrix::LOWER_LEFT_CORNER)
    d = @x.get_sub_square_matrix(SquareMatrix::LOWER_RIGHT_CORNER)

    # Puts the previous quarters in y
    y = SquareMatrix.new(@x.n)
    y.put_sub_square_matrix(a,SquareMatrix::UPPER_LEFT_CORNER)
    y.put_sub_square_matrix(b,SquareMatrix::UPPER_RIGHT_CORNER)
    y.put_sub_square_matrix(c,SquareMatrix::LOWER_LEFT_CORNER)
    y.put_sub_square_matrix(d,SquareMatrix::LOWER_RIGHT_CORNER)

    # Gets each of the quarters of SquareMatrix y
    e = y.get_sub_square_matrix(SquareMatrix::UPPER_LEFT_CORNER)
    f = y.get_sub_square_matrix(SquareMatrix::UPPER_RIGHT_CORNER)
    g = y.get_sub_square_matrix(SquareMatrix::LOWER_LEFT_CORNER)
    h = y.get_sub_square_matrix(SquareMatrix::LOWER_RIGHT_CORNER)

    e_table = "2 3 5 1
4 6 9 2
2 5 6 3
3 4 7 1
"
    f_table = "8 4 9 3
5 7 3 9
8 8 9 0
8 3 9 3
"
    g_table = "8 3 6 9
5 7 2 5
4 7 3 9
6 7 3 6
"
    h_table = "3 6 7 1
4 9 5 7
2 8 4 4
8 3 5 7
"
    assert_equal e_table, e.to_str
    assert_equal f_table, f.to_str
    assert_equal g_table, g.to_str
    assert_equal h_table, h.to_str
  end

  # Tests that compute_products method works as expected.
  # Note: Must remove or comment 'private' qualifier to compute_products in 
  # order to test it.
  def test_compute_products

    # Pre-calculated values for the 7 products
    p1_table = [[-18, 24], [-36, 48]]
    p2_table = [[99, 12], [189, 24]]
    p3_table = [[104, 88], [105, 75]]
    p4_table = [[9, 12], [3, 24]]
    p5_table = [[220, 92], [285, 114]]
    p6_table = [[-51, -20], [51, 22]]
    p7_table = [[-16, -32], [33, 39]]

    # Initializes the corresponding SquareMatrix objects
    p1 = SquareMatrix.new(2, p1_table)
    p2 = SquareMatrix.new(2, p2_table)
    p3 = SquareMatrix.new(2, p3_table)
    p4 = SquareMatrix.new(2, p4_table)
    p5 = SquareMatrix.new(2, p5_table)
    p6 = SquareMatrix.new(2, p6_table)
    p7 = SquareMatrix.new(2, p7_table)

    #z = SquareMatrix.compute_products(p1, p2, p3, p4, p5, p6, p7, 4)
    
    z_table = "79 72 81 36
150 136 153 72
113 100 114 60
108 99 111 48
"
    #assert_equal z_table, z.to_str
  end

  # Tests that strassens_multiplication method works as expected.
  # Note: Must remove or comment 'private' qualifier to 
  # strassens_multiplication in order to test it.
  def test_strassens_multiplication
    lb = @lb + @n
    y = SquareMatrix.read_square_matrix(@lines, lb, @n)

    #z = SquareMatrix.strassens_multiplication(@x, y, @n)

    z_table = "93 114 184 85 192 152 162 113
98 152 182 113 195 203 159 189
102 123 199 94 220 173 163 142
98 128 195 95 209 170 173 120
77 131 207 84 210 144 152 153
94 141 188 106 185 148 177 204
80 132 173 92 174 131 138 186
120 148 222 117 205 155 193 189
"
    #assert_equal z_table, z.to_str
  end

  # Tests that multiply (main) method works as expected.
  def test_multiply
    lb = @lb + @n
    y = SquareMatrix.read_square_matrix(@lines, lb, @n)

    z = SquareMatrix.multiply(@x, y)

    z_table = "93 114 184 85 192 152 162 113
98 152 182 113 195 203 159 189
102 123 199 94 220 173 163 142
98 128 195 95 209 170 173 120
77 131 207 84 210 144 152 153
94 141 188 106 185 148 177 204
80 132 173 92 174 131 138 186
120 148 222 117 205 155 193 189
"
    assert_equal z_table, z.to_str
  end
end