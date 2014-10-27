#------------------------------------------------------------------------------
# Class that solves an instance of the split inversions problem, defined as 
# follows:
# Input: Array a containing the numbers 1, 2, 3,..., n in some arbitrary order.
# Output: Number of inversions = number of pairs (i,j) of array indices with
# i < j and a[i] > a[j].
#------------------------------------------------------------------------------
class SplitInversions

  # Sorts given array and counts the number of inversions. Returns the number
  # of inversions of array a.
  # Params:
  # +a+:: +Array+ object to sort and count inversions for.
  def sort_and_count(a)
    # TODO: sort_and_count
  end

  # Sorts array and counts inversions between given bounds. Returns the number
  # of split inversions of array a.
  # Params:
  # +a+:: +Array+ to sort and count inversions for.
  # +lb+:: Lower-bound index.
  # +ub+:: Upper-bound index.
  def sort_and_count(a, lb, ub)
    # TODO: sort_and_count_bounded
  end

  # Merges b and c into a and counts split inversions. Returns the number of
  # split inversions.
  # Params:
  # +a+:: +Array+ to merge numbers into.
  # +b+:: +Array+ with the first-half numbers of a.
  # +c+:: +Array+ with the second-half numbers of a.
  # +lb+:: Lower-bound index.
  # +mid+:: Index of last element of b.
  # +ub+:: Upper-bound index.
  def merge_and_count_split_inversions(a, b, c, lb, mid, ub)
    
  end
end