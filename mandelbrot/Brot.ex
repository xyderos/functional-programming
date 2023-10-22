defmodule Brot do

  def mandelbrot(c, m) do
    z0 = Complex.new(0.0,0.0)
    test(0, z0, c, m)
  end

  defp test(i,z0,c,m) do
    if Complex.abs(z0)>2 do
      i
    else
      if (i==m) do
        0
      else
         a= Complex.sqr(z0)
         b= Complex.add(a, c)
        test(i + 1, b, c, m)
      end
    end
  end
end
