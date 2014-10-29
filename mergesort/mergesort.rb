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
      # sort_array(a, 0, a.size - 1)
    end

    # Sorts array between given bounds.
    # Params:
    # +a+:: +Array+ to sort.
    # +lb+:: Lower-bound index.
    # +ub+:: Upper-bound index.
    def sort_array(a, lb, ub)
      # TODO: Write method...
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
      # TODO :Write method...
    end
  end  # Ends class methods

end  # Ends class