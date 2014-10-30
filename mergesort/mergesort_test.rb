gem 'minitest'
require 'minitest/autorun'
require './mergesort'

#------------------------------------------------------------------------------
# :section: mergesort_test.rb
# This class tests that mergesort class works as expected. The sorting problem
# is defined as follows:
# Input: Array of n numbers, unsorted.
# Output: Array with the same n numbers, sorted in increasing order.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 29/10/2014
#------------------------------------------------------------------------------
class MergeSortTest < MiniTest::Test

  # Performs initializations for last, main test (sort)
  def setup
    # Reads lines from file and arranges them in an array of integers
    lines = read_lines("./data/100.txt")
    @a = []
    lines.each { |line| @a << line.to_i }

    lines = read_lines("./data/1000.txt")
    @b = []
    lines.each { |line| @b << line.to_i }

    lines = read_lines("./data/MergeSort.txt")  # Assignment case.
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

  # Tests that merge method works as expected.
  def test_merge

    # Test case 1.
    a = []
    b = [1, 3, 5]
    c = [2, 4, 6]
    MergeSort.merge(a, b, c, 0, 2, 5)
    assert_equal [1, 2, 3, 4, 5, 6], a

    # Test case 2.
    a = []
    b = [3, 4, 5]
    c = [1, 2]
    MergeSort.merge(a, b, c, 0, 2, 4)
    assert_equal [1, 2, 3, 4, 5], a
  end

  # Tests that merge_and_count_split_inversions(a, lb, ub) works as expected.
  def test_sort_array
    
    # Test case 1; 5 numbers.
    a = [5, 4, 3, 2, 1]
    MergeSort.sort_array(a, 0, a.size - 1)
    assert_equal [1, 2, 3, 4, 5], a

    # Test case 2; 10 numbers.
    a = [3, 9, 8, 4, 6, 10, 2, 5, 7, 1]
    MergeSort.sort_array(a, 0, a.size - 1)
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], a
  end

  # Test that main solver method works as expected for any list of numbers.
  def test_sort
    
    # Test case 1; 100 numbers.
    MergeSort.sort(@a)
    assert_equal 10, @a[9]
    assert_equal 25, @a[24]
    assert_equal 50, @a[49]
    assert_equal 75, @a[74]
    assert_equal 100, @a[99]

    # Test case 2; 1000 numbers.
    MergeSort.sort(@b)
    assert_equal 100, @b[99]
    assert_equal 250, @b[249]
    assert_equal 500, @b[499]
    assert_equal 750, @b[749]
    assert_equal 1000, @b[999]

    # Test case 3; 10,000 numbers.
    MergeSort.sort(@c)
    assert_equal 1000, @c[999]
    assert_equal 2500, @c[2499]
    assert_equal 5000, @c[4999]
    assert_equal 7500, @c[7499]
    assert_equal 10000, @c[9999]
  end

end