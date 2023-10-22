defmodule Tree do

  def add(nil,v), do: %{type: :tree, left: nil, right: nil, value: v}

  def add(%{type: :tree, left: l, right: r, value: v},e) when e>v , do: %{type: :tree, left: l, right: add(r,e), value:v}

  def add(%{type: :tree, left: left, right: r, value: v},e) when e<v , do: %{type: :tree, left: add(l,e), right: r, value:v}

  def swap(%{type: :tree, left: left, right: right, value v}), do: %{type: :tree, left: right, right: left, value v}

  def delete(nil, _), do: nil

  def delete(%{type: :tree, left: l, right: r, value: v}, n) when v==n , do: delete_node(%{type: :tree, left: l, right: r, value: v})

  def delete(%{type: :tree, left: l, right: r, value: v}, n) when n>v , do: %{type: :tree, left: l, right: delete(r,n), value: v}

  def delete(%{type: :tree, left: l, right: r, value: v}, n) when n<v , do: %{type: :tree, left: delete(l,n), right: r, value: v}

  def delete_node(%{type: :tree, left: nil, right: r, value: _}), do: r

  def delete_node(%{type: :tree, left: l, right: nil, value: _}), do: l

  def delete_node(%{type: :tree, left: l, right: r, value: _}), do: %{type: :tree, left: l, right: delete(r,min(r)), value: min(right)}

  def min(%{type: :tree, left: _, right:_, value: v}), do: v

  def min(%{type: :tree,left: l, right: r,value: _ }), do: min(l)

end
