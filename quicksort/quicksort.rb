#------------------------------------------------------------------------------
# :section: quicksort.rb
# QuickSort solves the sorting problem defined as follows:
# Input: Array of n numbers, unsorted.
# Output: Array with the same n numbers, sorted in increasing order.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 30/10/2014
#------------------------------------------------------------------------------
class QuickSort

  class << self

    # Sorts an array of numbers using quicksort.
    # Params:
    # +a+:: +Array+ of numbers to sort in increasing order.
    # +pivot+:: [Optional] Symbol with the pivot to use (:first, :last, 
    #  :median_of_three). Defaults to :first.
    def sort(a, pivot = :first)
      sort_array(a, 0, a.size - 1, pivot)
    end

    # Sorts array between given bounds.
    # Params:
    # +a+:: +Array+ to sort.
    # +lb+:: Lower-bound index.
    # +ub+:: Upper-bound index.
    # +pivot+:: [Optional] Symbol with the pivot to use (:first, :last, 
    #  :median_of_three). Defaults to :first.
    def sort_array(a, lb, ub, pivot = :first)
      # TODO: Write method...
    end

    # Partitions a between given bounds around first element.
    # Params:
    # +a+:: +Array+ to partition.
    # +lb+:: Lower-bound index.
    # +ub+:: Upper-bound index.
    def partition_first(a, lb, ub)
      # TODO: Write method...
    end

    # Partitions a between given bounds around last element.
    # Params:
    # +a+:: +Array+ to partition.
    # +lb+:: Lower-bound index.
    # +ub+:: Upper-bound index.
    def partition_last(a, lb, ub)
      # TODO: Write method...
    end

    # Partitions a between given bounds using the median-of-three rule.
    # Params:
    # +a+:: +Array+ to partition.
    # +lb+:: Lower-bound index.
    # +ub+:: Upper-bound index.
    def partition_median_of_three(a, lb, ub)
      # TODO: Write method...
    end

    # Sorts an array of numbers using quicksort. Returns the number of 
    # comparisons done.
    # Params:
    # +a+:: +Array+ of numbers to sort in increasing order.
    # +pivot+:: [Optional] Symbol with the pivot to use (:first, :last, 
    #  :median_of_three). Defaults to :first.
    def sort_and_count(a, pivot = :first)
      sort_array_and_count(a, 0, a.size - 1, pivot)
    end

    # Sorts array between given bounds. Returns the number of camparisons done.
    # Params:
    # +a+:: +Array+ to sort.
    # +lb+:: Lower-bound index.
    # +ub+:: Upper-bound index.
    # +pivot+:: [Optional] Symbol with the pivot to use (:first, :last, 
    #  :median_of_three). Defaults to :first.
    def sort_array_and_count(a, lb, ub, pivot = :first)
      # TODO: Write method...
    end
  end  # Ends class methods

end  # Ends class