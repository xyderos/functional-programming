defmodule Color do

  def convert(d, m) when (0<d/m) and (d/m<51) , do: %{type: :rgb, r: res(d,m), g: 0 , b: 0}

  def convert(d, m) when (51<d/m) and (d/m<102) , do: %{type: :rgb, r: 255,g: res(d,m), b: 0}

  def convert(d, m) when (102<d/m) and (d/m<153) , do: %{type: :rgb, r: 255-res(d,m), g: 255, b: 0}

  def convert(d, m) when (153<d/m) and (d/m<204) , do: %{type: :rgb, r: 0,g: 255, b: res(d,m)}

  def convert(d, m) when (204<d/m) and (d/m<255) , do: %{type: :rgb, r: 0,g: 255 - res(d,m), b: 255}

  def res(d,m), do: 255*((d/m)- Kernel.trunc((d/m)*4))

end
