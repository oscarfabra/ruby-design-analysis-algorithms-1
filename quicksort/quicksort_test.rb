gem 'minitest'
require 'minitest/autorun'
require './quicksort'

#------------------------------------------------------------------------------
# :section: quicksort_test.rb
# This class tests that quicksort class works as expected. The sorting problem
# is defined as follows:
# Input: Array of n numbers, unsorted.
# Output: Array with the same n numbers, sorted in increasing order.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 30/10/2014
#------------------------------------------------------------------------------
class QuickSortTest < MiniTest::Test

  # Performs initializations for last, main test (sort)
  def setup
    # Reads lines from file and arranges them in an array of integers
    lines = read_lines("./data/100.txt")
    @a = []
    lines.each { |line| @a << line.to_i }

    lines = read_lines("./data/1000.txt")
    @b = []
    lines.each { |line| @b << line.to_i }

    lines = read_lines("./data/QuickSort.txt")  # Assignment case.
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
    p_ix = QuickSort.partition_first(a, 0, 7)
    assert_equal 2, p_ix
    assert_equal [1, 2, 3, 5, 8, 4, 7, 6], a
  end

  # Tests that partition_last method works as expected.
  def test_partition_last

    # Test case 1.
    a = [3, 8, 2, 5, 1, 4, 7, 6]
    p_ix = QuickSort.partition_last(a, 0, 7)
    assert_equal 5, p_ix
    assert_equal [3, 2, 5, 1, 4, 6, 7, 8], a
  end

  # Tests that partition_median_of_three method works as expected.
  def test_partition_median_of_three

    # Test case 1.
    a = [3, 8, 2, 5, 1, 4, 7, 6]
    p_ix = QuickSort.partition_median_of_three(a, 0, 7)
    assert_equal 4, p_ix
    assert_equal [4, 2, 3, 1, 5, 8, 7, 6], a
  end
  
  # Tests that sort_array method works as expected.
  def test_sort_array
    
    # Test case 1; 5 numbers. Pivot defaults to first element.
    a = [5, 4, 3, 2, 1]
    QuickSort.sort_array(a, 0, a.size - 1)
    assert_equal [1, 2, 3, 4, 5], a

    # Test case 2; 10 numbers. Pivot defaults to first element.
    a = [3, 9, 8, 4, 6, 10, 2, 5, 7, 1]
    QuickSort.sort_array(a, 0, a.size - 1)
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], a
  end
  
  # Tests that sort method works as expected.
  def test_sort
    
    # Test case 1; 100 numbers. Pivot over first element.
    QuickSort.sort(@a, :first)
    assert_equal 10, @a[9]
    assert_equal 50, @a[49]
    assert_equal 100, @a[99]

    # Test case 2; 1,000 numbers. Pivot over last element.
    QuickSort.sort(@b, :last)
    assert_equal 100, @b[99]
    assert_equal 500, @b[499]
    assert_equal 1000, @b[999]

    # Test case 3; 10,000 numbers. Pivots using the median-of-three rule.
    QuickSort.sort(@c, :median_of_three)
    assert_equal 1000, @c[999]
    assert_equal 5000, @c[4999]
    assert_equal 10000, @c[9999]
  end

  # Tests that sort_and_count method works as expected.
  def test_sort_and_count

    # Test case 1; 100 numbers. Pivot over last element.
    count = QuickSort.sort_and_count(@a, :last)
    assert_equal 50, @a[49]
    assert_equal 100, @a[99]
    assert_equal 587, count

    # Test case 2; 1,000 numbers. Pivots using the median-of-three rule.
    count = QuickSort.sort_and_count(@b, :median_of_three)
    assert_equal 500, @b[499]
    assert_equal 1000, @b[999]
    assert_equal 8921, count

    # Test case 1; 10,000 numbers. Pivots over the first element.
    # NOTE: Must increase RubyVM stack memory with the following command:
    # export RUBY_THREAD_VM_STACK_SIZE=2000000
    count = QuickSort.sort_and_count(@c, :first)
    assert_equal 1000, @c[999]
    assert_equal 5000, @c[4999]
    assert_equal 10000, @c[9999]
    assert_equal 162085, count
  end
end