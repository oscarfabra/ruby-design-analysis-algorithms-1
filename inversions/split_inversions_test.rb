gem 'minitest'
require 'minitest/autorun'
require './split_inversions'

#------------------------------------------------------------------------------
# This class tests that split_inversions class works as expected. The split
# inversions problem is defined as follows:
# Input: Array a containing the numbers 1, 2, 3,..., n in some arbitrary order.
# Output: Number of inversions = number of pairs (i,j) of array indices with
# i < j and a[i] > a[j].
#------------------------------------------------------------------------------
class SplitInversionsTest < MiniTest::Test

  # Performs initializations for last, main test (sort_and_count)
  def setup
    # Reads lines from file and arranges them in an array of integers
    lines = read_lines("./data/inversions_50_1.txt")
    @a = []
    lines.each { |line| @a << line.to_i }

    lines = read_lines("./data/inversions_100_1.txt")
    @b = []
    lines.each { |line| @b << line.to_i }

    lines = read_lines("./data/IntegerArray.txt")  # Assignment case.
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

  # Tests that merge_and_count_split_inversions(a) method work as expected.
  def test_merge_and_count_split_inversions

    # Test case 1.
    a = []
    b = [1, 3, 5]
    c = [2, 4, 6]
    inversions = 
      SplitInversions.merge_and_count_split_inversions(a, b, c, 0, 2, 5)
    assert_equal 3, inversions
    assert_equal [1, 2, 3, 4, 5, 6], a

    # Test case 2.
    a = []
    b = [3, 4, 5]
    c = [1, 2]
    inversions = 
      SplitInversions.merge_and_count_split_inversions(a, b, c, 0, 2, 4)
    assert_equal 6, inversions
    assert_equal [1, 2, 3, 4, 5], a
  end

  # Tests that merge_and_count_split_inversions(a, lb, ub) work as expected.
  def test_sort_and_count_bounded
    
    # Test case 1; 5 numbers.
    a = [1, 5, 3, 2, 4]
    inversions = SplitInversions.sort_and_count(a, 0, a.size - 1)
    assert_equal 4, inversions
    assert_equal [1, 2, 3, 4, 5], a

    # Test case 2; 5 numbers.
    a = [5, 4, 3, 2, 1]
    inversions = SplitInversions.sort_and_count(a, 0, a.size - 1)
    assert_equal 10, inversions
    assert_equal [1, 2, 3, 4, 5], a

    # Test case 3; 15 numbers.
    a = [9, 12, 3, 1, 6, 8, 2, 5, 14, 13, 11, 7, 10, 4, 0]
    inversions = SplitInversions.sort_and_count(a, 0, a.size - 1)
    assert_equal 56, inversions
    assert_equal [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], a
  end

  # Test that main solver method work as expected for any list of numbers.
  def test_sort_and_count_inversions
    
    # Test case 1; 50 numbers.
    inversions = SplitInversions.sort_and_count_inversions(@a)
    assert_equal 590, inversions

    # Test case 2; 100 numbers.
    inversions = SplitInversions.sort_and_count_inversions(@b)
    assert_equal 2372, inversions

    # Assignment case; 100,000 numbers.
    inversions = SplitInversions.sort_and_count_inversions(@c)
    puts "inversions = #{inversions}."
  end

end