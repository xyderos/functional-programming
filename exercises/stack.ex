defmodule Stack do

  def push(nil,e), do: %{value: e, next: nil}

  def push(%{:value: val, next: l}, e), do: %{:value: val, next: push(l,e)}

  def pop(%{value: val, next: nil}), do: val

  def pop(%{value: val, next: n}), do: pop(n)

  def size(st), do: size(st,0)

  def size(nil, acc), do: acc

  def size(%{value: val, next: n}, acc), do: size(n, acc+1)

end
