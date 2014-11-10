gem 'minitest'
require 'minitest/autorun'
require './selection'

#------------------------------------------------------------------------------
# :section: selection_test.rb
# This class tests that Selection class works as expected. The selection 
# problem is defined as follows:
# Input: Array of n numbers, unsorted, and a number i in {1, 2,..., n}.
# Output: ith order statistic (i.e. ith smallest element) of the array.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 10/11/2014
#------------------------------------------------------------------------------
class SelectionTest < MiniTest::Test

  # Performs initializations for last, main test (r_select)
  def setup
    # Reads lines from file and arranges them in an array of integers
    lines = read_lines("./data/100.txt")
    @a = []
    lines.each { |line| @a << line.to_i }

    lines = read_lines("./data/1000.txt")
    @b = []
    lines.each { |line| @b << line.to_i }

    lines = read_lines("./data/Selection.txt")  # Assignment case.
    @c = []
    lines.each { |line| @c << line.to_i }
  end

  # Reads lines of given file and arranges them in a list. Returns a list of
  # +String+ objects with the values for the problem. Throws exception if file
  # couldn't be read.
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

  # Tests that partition_first method works as expected.
  def test_partition_first

    # Test case 1.
    a = [3, 8, 2, 5, 1, 4, 7, 6]
    p_ix = Selection.partition_first(a, 0, 7)
    assert_equal 2, p_ix
    assert_equal [1, 2, 3, 5, 8, 4, 7, 6], a
  end

  # Tests that partition_last method works as expected.
  def test_partition_last

    # Test case 1.
    a = [3, 8, 2, 5, 1, 4, 7, 6]
    p_ix = Selection.partition_last(a, 0, 7)
    assert_equal 5, p_ix
    assert_equal [3, 2, 5, 1, 4, 6, 7, 8], a
  end

  # Tests that partition_median_of_three method works as expected.
  def test_partition_median_of_three

    # Test case 1.
    a = [3, 8, 2, 5, 1, 4, 7, 6]
    p_ix = Selection.partition_median_of_three(a, 0, 7)
    assert_equal 4, p_ix
    assert_equal [4, 2, 3, 1, 5, 8, 7, 6], a
  end
  
  # Tests that r_select_bounded method works as expected.
  def test_r_select_bounded
    
    # Test case 1; 5 numbers. Pivot defaults to first element.
    a = [5, 4, 3, 2, 1]
    i = Selection.r_select_bounded(a, a.size, 4)
    assert_equal 4, i

    # Test case 2; 10 numbers. Pivot defaults to first element.
    a = [3, 11, 8, 4, 6, 13, 2, 5, 7, 1]
    i = Selection.r_select_bounded(a, a.size, 9)
    j = Selection.r_select_bounded(a, a.size, 10)

    assert_equal 11, i
    assert_equal 13, j
  end
  
  # Tests that r_select works as expected.
  def test_r_select

    # Test case 1; 100 numbers. Pivot over first element.
    i = Selection.r_select(@a, 10)
    j = Selection.r_select(@a, 50)
    k = Selection.r_select(@a, 75)

    assert_equal 10, i
    assert_equal 50, j
    assert_equal 75, k

    # Test case 2; 1,000 numbers. Pivot over last element.
    i = Selection.r_select(@b, 100, :last)
    j = Selection.r_select(@b, 500, :last)
    k = Selection.r_select(@b, 750, :last)
    
    assert_equal 100, i
    assert_equal 500, j
    assert_equal 750, k

    # Test case 3; 10,000 numbers. Pivots using the median-of-three rule.
    i = Selection.r_select(@c, 1000, :median_of_three)
    j = Selection.r_select(@c, 5000, :median_of_three)
    k = Selection.r_select(@c, 7500, :median_of_three)
    
    assert_equal 1000, i
    assert_equal 5000, j
    assert_equal 7500, k
  end
end