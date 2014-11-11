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
    # +i+:: Order statistic to search for, i in {1, 2,..., a.size}
    def r_select(a, i)
      r_select_bounded(a, a.size, i - 1)
    end

    # Finds and returns the ith order statistic of a given array of numbers.
    # Params:
    # +a+:: +Array+ of numbers, unsorted.
    # +n+:: Size of the array. n = a.size.
    # +i+:: Index of order statistic to search for, i in {0, 1,..., n - 1}
    def r_select_bounded(a, n, i)
      if n == 1
        return a[i]
      end
      puts "a = #{a}"
      puts "Choosing pivot..."
      p = choose_random_pivot(a, n)   # Chooses a pivot uniformly at random
      puts "p = #{p} (Pivot)"
      puts "a = #{a}"
      puts "Partitioning around pivot..."
      j = partition_first(a, 0, n - 1)
      puts "j = #{j} (New index of pivot)"
      puts "i = #{i} (Index of order statistic to search for)"
      puts "n = #{n} (Size of array)"
      puts "a = #{a}"
      puts "-" * 10
      if j == i
        return p
      elsif j > i
        return r_select_bounded(a[0..(j - 1)], j, i)
      else
        return r_select_bounded(a[(j + 1)..(n - 1)], n - j - 1, i - j - 1)
      end
    end

    # Partitions a between given bounds around first element. Returns index of 
    # pivot. Params:
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

    # Chooses a random pivot from a, uniformly at random and swaps it with
    # element at position 0. Returns the element to pivot at.
    def choose_random_pivot(a, n)
      p_ix = rand(n)
      a[p_ix], a[0] = a[0], a[p_ix]
      a[0]
    end
  end  # Ends class methods

end  # Ends class