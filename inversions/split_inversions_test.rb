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

  # Performs initializations for the test.
  def setup
    # Setup values...
    # @lines = read_lines("./data/")
  end

  # Reads lines of given file and arranges them in a list. Returns a list of
  # +String+ objects with the values for the problem. Throws exception if file
  # couldn't be read.
  # Params:
  # +filename+:: Path relative to the file with the input for the problem.
  def read_lines(filename)
    # TODO: Read lines from stdin and arrange them in a list.
  end

  # Tests that merge_and_count_split_inversions(a) method work as expected.
  def test_merge_and_count_split_inversions
    # TODO: Write test...
  end

  # Tests that merge_and_count_split_inversions(a,lb,ub) work as expected.
  def test_sort_and_count_bounded
    # TODO: Write test...
  end

  # Test that main solver method work as expected for any list of numbers.
  def test_sort_and_count
    # TODO: Write test...
  end

end