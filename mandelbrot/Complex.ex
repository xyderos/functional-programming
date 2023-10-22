defmodule Complex do

  def new(r,i), do: %{type: :complex,real: r ,imaginary: i}

  def add(%{type: :complex, real: r1, imaginary: i1},%{type: :complex, real: r2, imaginary: i2}), do: %{type: :complex, real: r1+r2, imaginary: i1+i2 }

  def sqr(%{type: :complex, real: r, imaginary: i}), do: %{type: :complex, real: (r*r) - (i*i), imaginary: 2*r*i}

  def abs(%{type: :complex, real: r, imaginary: i}), do: :math.sqrt((r*r)+(i*i))

end
