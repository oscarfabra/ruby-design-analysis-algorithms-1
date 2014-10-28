#------------------------------------------------------------------------------
# Class that solves an instance of the split inversions problem, defined as 
# follows:
# Input: Array a containing the numbers 1, 2, 3,..., n in some arbitrary order.
# Output: Number of inversions = number of pairs (i,j) of array indices with
# i < j and a[i] > a[j].
#------------------------------------------------------------------------------
class SplitInversions

  class << self

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
      if ub <= lb
        0
      else
        mid = lb + (ub - lb)/2  # Gets middle index
        x = sort_and_count(a, lb, mid)  # Sorts and counts first half of a
        y = sort_and_count(a, mid + 1, ub)  # Sorts and counts second half of a

        b = a[lb..mid]  # Gets left subarray
        c = a[mid + 1..ub]  # Gets right subarray

        z = merge_and_count_split_inversions(a, b, c, lb, mid, ub)
        x + y + z
      end
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
      inversions = 0
      i = 0
      j = 0
      #puts "b = #{b}, c = #{c}, lb = #{lb}, mid = #{mid}, ub = #{ub}"
      (lb..ub).each do |k|
        #puts "b[i] = #{b[i]}, c[j] = #{c[j]}, i = #{i}, j = #{j}, k = #{k}."
        if i >= b.size  # Nothing to add from b
          a[k] = c[j]
          j += 1
        elsif j >= c.size  # Nothing to add from c
          a[k] = b[i]
          i += 1
        elsif b[i] <= c[j]
          a[k] = b[i]
          i += 1
        else  # b[i] >= c[j]
          a[k] = c[j]
          inversions += mid - lb + 1 - i
          j += 1
        end
      end
      inversions
    end

  end  # Ends class methods

end