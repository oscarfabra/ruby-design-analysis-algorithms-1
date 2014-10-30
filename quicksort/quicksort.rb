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
      if lb < ub  # If lb >= ub array is already sorted
        p_ix = partition(a, lb, ub, pivot)  # Returns index of pivot
        sort_array(a, lb, p_ix - 1, pivot)
        sort_array(a, p_ix + 1, ub, pivot)
      end
    end

    # Partitions a between given bounds around first element. Returns index of 
    # pivot.
    # Params:
    # +a+:: +Array+ to partition.
    # +lb+:: Lower-bound index.
    # +ub+:: Upper-bound index.
    def partition_first(a, lb, ub)
      p = a[lb]
      i = lb + 1
      (lb + 1..ub).each do |j|
        if a[j] < p
          a[i], a[j] = a[j], a[i]  # Swaps elements at i and j
          i += 1
        end
      end
      a[lb], a[i - 1] = a[i - 1], a[lb]  # Swaps elements at lb and i - 1
      i - 1  # Returns index of pivot
    end

    # Partitions a between given bounds around last element. Returns index of
    # pivot.
    # Params:
    # +a+:: +Array+ to partition.
    # +lb+:: Lower-bound index.
    # +ub+:: Upper-bound index.
    def partition_last(a, lb, ub)
      a[lb], a[ub] = a[ub], a[lb]  # Swaps elements at lb and ub
      partition_first(a, lb, ub)  # Partitions around first element
    end

    # Partitions a between given bounds using the median-of-three rule. Returns
    # index of pivot.
    # Params:
    # +a+:: +Array+ to partition.
    # +lb+:: Lower-bound index.
    # +ub+:: Upper-bound index.
    def partition_median_of_three(a, lb, ub)
      mid = lb + (ub - lb)/2
      med_ix = 0  # Finds index of the median-of-three
      if (a[lb] <= a[mid] && a[mid] <= a[ub]) || 
        (a[ub] <= a[mid] && a[mid] <= a[lb])
        med_ix = mid
      elsif (a[mid] <= a[ub] && a[ub] <= a[lb]) || 
            (a[lb] <= a[ub] && a[ub] <= a[mid])
        med_ix = ub
      else
        med_ix = lb
      end
      a[lb], a[med_ix] = a[med_ix], a[lb]  # Swaps elements at med_ix and lb
      partition_first(a, lb, ub)  # Partitions around first element
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
      if lb == ub  # Array is already sorted
        0
      else
        x = ub - lb  # Adds the number of comparisons of upcoming partition
        p_ix = partition(a, lb, ub, pivot)  # Returns index of pivot
        y = sort_array_and_count(a, lb, p_ix - 1, pivot)
        z = sort_array_and_count(a, p_ix + 1, ub, pivot)
        x + y + z  # Returns the number of comparisons
      end
    end

    private   # Private class methods

      # Partitions a between lb and ub around the specified pivot.
      def partition(a, lb, ub, pivot)
        if pivot == :first
          partition_first(a, lb, ub)
        elsif pivot == :last
          partition_last(a, lb, ub)
        else  # pivot == :median_of_three
          partition_median_of_three(a, lb, ub)
        end
      end
  end  # Ends class methods

end  # Ends class