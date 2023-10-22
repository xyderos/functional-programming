defmodule Tree do

  def new(k,v), do: {:leaf, k, v}

  def add(nil,k,v), do: new(k,v)

  def add({:leaf, k1,_}=l,k,v) when k<k1 , do: {:two, k, {:leaf,k,v},l}

  def add({:leaf, k1,_}=l,k,v) when k>k1 , do: {:two, k1,l,{:leaf,k,v}}

  def add({:two, k1,l1,l2},k,v) when k>k1 , do: {:three, k1,k,l1,l2,{:leaf,k,v}}

  def add({:two, k1,l1,l2},k,v) when k<k1 , do: {:three, k,k1,{:leaf,k,v},l1,l2}

  def add({:two, k1,l1,l2},k,v), do: {:three, k1,k,l1,{:leaf,k,v},l2}

  def add({:three,k1,k2,l1,l2,l3},k,v) when k<k1 , do: {:four,k,k1,k2,{:leaf,k,v},l1,l2,l3}

  def add({:three,k1,k2,l1,l2,l3},k,v) when k<k2 , do: {:four,k1,k,k2,l1,{:leaf,k,v},l2,l3}

  def add({:three,k1,k2,l1,l2,{:leaf,k3,_}=l3},k,v) when k<k3 , do: {:four,k1,k2,k3,l1,l2,{:leaf,k,v},l3}

  def add({:three,k1,k2,l1,l2,l3},k,v), do: {:four,k1,k2,k,l1,l2,l3,{:leaf,k,v}}



end
