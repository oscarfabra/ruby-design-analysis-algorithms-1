#------------------------------------------------------------------------------
# :section: mergesort.rb
# MergeSort solves the sorting problem defined as follows:
# Input: Array of n numbers, unsorted.
# Output: Array with the same n numbers, sorted in increasing order.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 29/10/2014
#------------------------------------------------------------------------------
class MergeSort

  class << self

    # Sorts given array using mergesort.
    # Params:
    # +a+:: +Array+ of numbers to sort in increasing order.
    def sort(a)
      sort_array(a, 0, a.size - 1)
    end

    # Sorts array between given bounds.
    # Params:
    # +a+:: +Array+ to sort.
    # +lb+:: Lower-bound index.
    # +ub+:: Upper-bound index.
    def sort_array(a, lb, ub)
      if ub > lb  # If ub <= lb array is already sorted

        mid = lb + (ub - lb)/2  # Finds middle index
        sort_array(a, lb, mid)  # Sorts first half of a
        sort_array(a, mid + 1, ub)  # Sorts second half of a

        b = a[lb..mid]  # Gets left subarray
        c = a[mid + 1..ub]  # Gets right subarray

        merge(a, b, c, lb, mid, ub)  # Merges arrays b and c into a
      end
    end

    # Merges arrays b and c into a.
    # Params:
    # +a+:: +Array+ to merge numbers into.
    # +b+:: +Array+ with the first-half numbers of a.
    # +c+:: +Array+ with the second-half numbers of a.
    # +lb+:: Lower-bound index.
    # +mid+:: Index of last element of b.
    # +ub+:: Upper-bound index.
    def merge(a, b, c, lb, mid, ub)
      i = 0
      j = 0
      (lb..ub).each do |k|
        if i >= b.size  # Nothing to add from b
          a[k] = c[j]
          j += 1
        elsif j >= c.size  # Nothing to add from c
          a[k] = b[i]
          i += 1
        elsif b[i] <= c[j]
          a[k] = b[i]
          i += 1
        else  # b[i] > c[j]
          a[k] = c[j]
          j += 1
        end
      end
    end
  end  # Ends class methods

end  # Ends class