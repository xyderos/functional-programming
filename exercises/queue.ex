defmodule Queue do

  def enqueue(nil,e), do: %{value: e, next: nil}

  def enqueue(%{value: val, next: l}=leaf,e), do: %{value: val, next: push(l,e)}

  def dequeue(%{value: val, next: nil}), do: nil

  def dequeue(%{value: val, next: n}), do: n

  def size(st), do: size(st,0)

  def size(nil, acc), do: acc

  def size(%{value: val, next: n}, acc), do: size(n, acc+1)

end
