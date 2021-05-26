defmodule DsAlgo do
  @moduledoc """
  Documentation for `DsAlgo`.
  """
  @doc """
  Returns factorial of given number.

  ## Examples

      iex> DsAlgo.factorial(5)
      120

  """
  def factorial(0) do 1 end

  def factorial(n) do
    n*factorial(n-1)
  end

####################################

  @doc """
    Prints the square of numbers of given array

    ## Parameters

    - array: Array that contains the given number

    ## Examples

      iex> DsAlgo.do_square([1,2,3])
      [1,4,9]
    """

    def do_square(array) do
      Enum.map array, fn(num) ->
        num*num
      end
    end

#################################
  @doc """
    Prints elements that sums equal to targetsum

    ## Parameters

    - array: Array that represents the numbers
    - targetsum: Target sum

    ## Examples

      iex> DsAlgo.two_sum([1,2,3],3)
      [2,1]
    """
    def two_sum(array,targetsum) do
      twosum(array, %{}, targetsum)
    end

    def twosum([], _map, _targetsum) do
      IO.puts("No  match found")
    end

    def twosum([first | rest ], map, targetsum) do
      potentialmatch = targetsum - first
      if Map.has_key?(map, potentialmatch) do
        [first | [potentialmatch]]
      else
        map = Map.put(map, first, :true)
        twosum(rest, map, targetsum)
      end
    end

############################################

  @pairs %{"{" => "}", "[" => "]", "(" => ")"}
  @opener ["{", "[", "("]
  @closer ["}", "]", ")"]


  @doc """
    Returns if paranthesis is valid or not

    ## Parameters

    - string: string that contains the parenthesis and characters

    ## Examples

      iex> DsAlgo.check_parenthesis("[{(){abc}}]")
      true
    """
  def check_parenthesis(expression) do
    expression
      |> String.split("")
      |> Enum.filter(&(&1 in @opener || &1 in @closer))
      |> iterate([])
  end

  defp iterate([], []), do: true
  defp iterate([], _stack), do: false

  defp iterate([head | tail], stack) when head in @opener,
    do: iterate(tail, [head | stack])

  defp iterate([head | _], []) when head in @closer, do: false

  defp iterate([head | tail], [stack_head | stack_tail]) when head in @closer,
    do: @pairs[stack_head] == head && iterate(tail, stack_tail)

########################################################
  @doc """
    Prints if Subsequence is valid or not

    ## Parameters

    - array1: array that contains the sequence
    - array2: array that contains the subsequence

    ## Examples

      iex> DsAlgo.check_subseq([1,2,3],[2,3])
      true
  """

  def check_subseq([],[]) do true end

  def check_subseq([], _array) do false end

  def check_subseq(_array, []) do true end


  def check_subseq([head_m | tail_m], [head_s | tail_s]) do
    if head_s == head_m do
      check_subseq(tail_m, tail_s)
    else
      check_subseq(tail_m, [head_s | tail_s])
    end
  end

#############################################################
  @doc """
    Prints frequency of words of given text file

    ## Parameters

    - file_path: address of the file
  """
  def read_text(file_path) do
    file_path
    |> File.read!()
    |> String.split()
    |> reduce_list(%{})
  end

  def reduce_list([], reduced) do reduced end

  def reduce_list([first | rest ], reduced) do
    if Map.has_key?(reduced, first) do
      reduce_list(rest, Map.put(reduced, first, reduced[first]+1))
    else
      reduce_list(rest, Map.put(reduced, first, 1))
    end
  end
######################################################




  def longest(s) do
    n = String.length(s)
    Enum.each(0..n-1, fn(x) ->
      c = String.at(s,x)

      IO.inspect(c)
    end)
  end
end
