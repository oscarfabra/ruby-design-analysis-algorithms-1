#------------------------------------------------------------------------------
# :section: selection.rb
# Selection solves the problem of selecting the ith order statistic from an
# array of integers.
# Input: Array of n numbers, unsorted, and a number i in {1, 2,..., n}.
# Output: ith order statistic (i.e. ith smallest element) of the array.
# *author*:: <a href="mailto:oscarfabra@gmail.com">Oscar Fabra</a>
# *version*:: 1.0
# *since*:: 10/11/2014
#------------------------------------------------------------------------------
class Selection

  class << self

    # Finds and returns the ith order statistic of a given array of numbers.
    # Params:
    # +a+:: +Array+ of numbers, unsorted.
    # +i+:: Order statistic to search of, i in {1, 2,..., a.size}
    # +pivot+:: [Optional] Symbol with the pivot to use (:first, :last, 
    #  :median_of_three). Defaults to :first.
    def r_select(a, i, pivot = :first)
      # TODO: Define method.
    end

    # Finds and returns the ith order statistic of a given array of numbers.
    # Params:
    # +a+:: +Array+ of numbers, unsorted.
    # +n+:: Size of the array.
    # +i+:: Order statistic to search of, i in {1, 2,..., a.size}
    # +pivot+:: [Optional] Symbol with the pivot to use (:first, :last, 
    #  :median_of_three). Defaults to :first.
    def r_select_bounded(a, n, i, pivot = :first)
      # TODO: Define method.
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