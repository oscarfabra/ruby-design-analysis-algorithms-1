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
class SplitInversionsTest < MiniTest::Unit::TestCase

  # Performs initializations for the tests.
  def setup
    # Reads lines from file and arranges them in an array of integers
    lines = read_lines("./data/inversions_5_1.txt")
    @a = []
    lines.each do |line|
      @a << line.to_i
    end
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
    a = []
    b = [1, 3, 5]
    c = [2, 4, 6]
    inversions = 
      SplitInversions.merge_and_count_split_inversions(a, b, c, 0, 2, 5)
    
    # split_inversions should be 3, a should be [1, 2, 3, 4, 5, 6]
    assert_equal 3, inversions
    assert_equal [1, 2, 3, 4, 5, 6], a

    a = []
    b = [3, 4, 5]
    c = [1, 2]
    inversions = 
      SplitInversions.merge_and_count_split_inversions(a, b, c, 0, 2, 4)

    # split_inversions should be 6, a should be [1, 2, 3, 4, 5]
    assert_equal 6, inversions
    assert_equal [1, 2, 3, 4, 5], a
  end

  # Tests that merge_and_count_split_inversions(a,lb,ub) work as expected.
  #def test_sort_and_count_bounded
    # TODO: Write test...
  #end

  # Test that main solver method work as expected for any list of numbers.
  #def test_sort_and_count
    # TODO: Write test...
  #end

end