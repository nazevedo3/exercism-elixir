defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]
  @empty Map.new(@nucleotides, & {&1, 0})

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count('' = _strand, _nucleotide), do: 0

  def count(strand, nucleotide)  do
    for s <- strand, String.contains?(to_string(s), to_string(nucleotide)), reduce: 0 do
      acc ->
        acc + 1
    end
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram('' =_strand), do: @empty



  def histogram(strand) do
    for s <- strand, reduce: %{} do
      acc ->
        updated = Map.update(acc, s, 1, & &1 + 1)
        Map.merge(@empty, updated)
    end
  end

  end
