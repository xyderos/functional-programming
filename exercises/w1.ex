defmodule Intro do

  def double(), do: 0

  def double(n), do: n*2

  def ftC(), do: 0

  def ftC(n), do: (n-2)/18

  def area1(_,0), do: 0

  def area1(0,_), do: 0

  def area1(x,y), do: (x*y)/2

  def area2(_,0), do: 0

  def area2(0,_), do:0

  def area2(x,y), do: area1(x,y)*2

  def area3(0), do: 0

  def area3(r), do: 3.14*r*r

  def product(x,y), do: product(x,y,0)

  def product(0,_,_), do: 0

  def product(x,y,a) do
    if y==0 do
      a
    else
      product(x,y-1,a+x)
    end
  end

  def product1(_,0), do: 0

  def product1(0,_), do: 0

  def product1(x,y) do
    if y==0 do
      x
    else
      x+product(x,y-1)
    end
  end

  def exp1(_,0), do: 1

  def exp1(x,1), do: x

  def exp1(x,y), do: x*exp1(x,y-1)

  def exp2(x,y) do
    case y do
      1->x
      0->1
      _-> x*(exp2(x,y-1))
    end
  end

  def exp(x,0,a), do: a

  def exp(x,1,a), do: x

  def exp(x,y,a), do: exp(x,y-1,a*x)

  def nth([],_), do: nil

  def nth([h|t],1), do: h

  def nth([h|t],x), do :nth([h1|t1]=t,x-1)

  def len([]), do: 0

  def len(l), do: len(l,0)

  def len([],n), do: n

  def len([h|t],n), do: len([h1|t1]=t,n+1)

  def sum([]), do: 0

  def sum(l), do: sum(l,0)

  def sum([],a), do: a

  def sum([h|t],a), do: sum([h1|t1]=t,a+h)

  def dup([]), do: []

  def dup(l), do: dup(l,[])

  def dup([],t), do: t

  def dup([h|t],t), do: dup([h1|t1]=t,t++h)

  defp contains([],_), do: false

  defp contains([h|t],e) do
    if h==e do
      true
    else
      contains([h1|t1]=t,e)
    end
  end

  def add_unique([],e), do: [e]

  def add_unique(l,e) do
    if contains(l,e) do
      :ok
    else
      l++e
    end
  end

  def remove([],e), do: []

  def remove(l,e), do: remove(l,e,[])

  def remove([],e,l1), do: l1

  def remove([h|t],e,l1) do
    if h==e do
      remove(t,e,l1)
    else
      remove(t,e,[h|l1])
    end
  end

  def unique([]), do: []

  def unique(l), do: unique(l,[])

  def unique([h|t],l1) do
    l1++[h]
    if contains(t,h) do
      remove(t,h)
      unique([h1|t1]=t,h,l1)
    else
      unique([h1|t1]=t,l1)
    end
  end

  def unique([],_,l1), do :l1

  def contains_c([],e), do: 0

  def contains_c(l,e), do: contains_c(l,e,0)

  def contains_c([],e,c), do: c

  def contains_c([h|t],e,c) do
    if h==e do
      contains_c(t,e,c+1)
    else
      contains_c(t,e,c)
    end
  end

  def add_same(l,0,l1), do: l1

  def add_same([h|t],c,l1) do
    l1++[h]
    if c==0 do
      l1
    else
      add_same(t,c-1,l1)
    end
  end

  def pack([]), do: []

  def pack(l), do: pack(l,[])

  defp pack([],l1), do: l1

  defp pack([h|t],l1) do
    lt=[h]
    if contains(t,h) do
      add_same(t,contains_c(t,h),lt)
      remove(t,h)
      pack(t,l1++lt)
    else
      pack(t,l1++[h])
    end
  end

  def reverse([]), do: []

  def reverse(l), do: reverse(l,[])

  def reverse([],l1), do: l1

  def reverse([h|t],l1), do: reverse(t,[h|l1])

  def swap(l,a,b) do
    a = Enum.fetch!(l,a)
    b = Enum.fetch!(l,b)

    l
    |> List.replace_at(a,b)
    |> List.replace_at(b,a)
  end

  def msort([]), do: []

  def msort([x]), do: [x]

  def msort(l) do
    {l1,l2}=split(l,[],[])
    merge(msort(l1),msort(l2))
  end

  def split([],l1,l2), do: {l1,l2}

  def split([h|t],l1,l2), do: split(t,[h|l2],l1)

  def merge(l1,[]), do: l1

  def merge([],l2), do: l2

  def merge([x1|l1],[x2|_]=l2) when x1<x2 , do: [x1 | merge(listOne, listTwo)]

  def merge(l1, [x2 | l2]), do: [x2 | merge(l1, l2)]

  def qsort([]), do: []

  def qsort([x]), do: [x]

  def qsort([h|t]) do
    {l1,l2}=qsplit(p,t,l1,l2)
    small=qsort(l1)
    big=qsort(l2)
    small++[p]++big
  end

  def qsplit(p,[],l1,l2), do: {l1,l2}

  def qsplit(p,[h|t],l1,l2) when h<=p , do: qsplit(p,t,[h|l1],l2)

  def qsplit(p,[h|t],l1,l2) when h>p , do: qsplit(p,t,l1,[h|l2])

end
