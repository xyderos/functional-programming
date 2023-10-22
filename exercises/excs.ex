defmodule Exam do

  def sum(nil), do: 0

  def sum(%{type: :tree, left: l, right: r, value: v}), do: sum(l) + sum(r) + v

  def reverse(l), do: reverse(l,[])

  def reverse([], acc), do: acc

  def reverse([h|t], l), do: reverse(t,[h|l])

  def append([],acc), do: acc

  def append(l,nl), do: reverse(reverse(l), nl)

  def mirror(nil), do: nil

  def mirror(%{type: :tree, left: l, right: r, value: v}), do: %{type: :mirrored, left: mirror(r), right: mirror(l), value: v }

  def enqueue({:queue, head, tail}, elem), do: {:queue, head, [elem|tail]}

  def dequeue({:queue, [], []}), do: :fail

  def dequeue({:queue, [elem|head], tail}), do: {:ok, elem, {:queue, head, tail}}

  def dequeue({:queue, [], tail}), do: dequeue({:queue, reverse(tail), []})

  def new(), do: %{type: :heap, value: nil, left: nil, right: nil}

  def add(nil, e), do: %{type: :heap, value: e, left: nil, right: nil}

  def add(%{type: heap, value: e, left: _, right: r}, v) when e> v , do: %{type: heap, value: e, left: add(r,v), right: r}

  def add(%{type: heap, value: e, left: _, right: r}, v), do: %{type: heap, value: v, left: add(r,e), right: r}

  def split(l), do: split(l,[],[])

  def split([],acc1,acc2), do: {acc1,acc2}

  def split([h|t], l1,l2), do: split(t,[h|l2], l1)

  def fizzbuzz(n), do: fizzbuzz(0,n,0,0)

  def fizzbuzz(n,n,_,_), do: []

  def fizzbuzz(i,n,3,5), do: [:fizzbuzz|fizzbuzz(i+1,n,1,1)]

  def fizzbuzz(i,n,3,f), do: [:fizz|fizzbuzz(i+1,n,1,f+1)]

  def fizzbuzz(i,n,b,5), do: [:buzz|fizzbuzz(i+1,n,b+1,1)]

  def fizzbuzz(i,n,b,f), do: [i|fizzbuzz(i+1,n,b+1,f+1)]

  def fairly(nil), do: {:ok,0}

  def fairly({:node,_, left, right}) do

    case fairly(left) do
      {:ok, n1}->
        case fairly(right) do
          {:ok, n2}->
            if abs(n2-n1)<=1 do
              {:ok, max(n1,n2)}
            else
              :no
            end
          :no -> :no
        end
      :no -> :no
    end
  end

  def sort([], acc), do: acc

  def sort([h1|t1],[h2|_]=l) when h1<h2 , do: sort(t1,[h1|l])

  def sort([h1|t1],[_|t2]), do: sort(t1,sort(t2,h1))

  def lookup(nil,_), do: {:error, :lululuululu}

  def lookup({_, _ , v},v), do: {:value, v}

  def lookup({_, r , v},e) when e>v , do: lookup(r,e)

  def lookup({l,_,v},e) when e<v , do: lookup(l,e)

  def min1(nil, acc), do: acc

  def min1({_,_,v}=t), do: min1(t,v)

  def min1({{l1,_,v1},_,_}, acc) when v1<acc , do: min1(l1)

  def min1({_,r,_},_), do: min1(r)

  def freq(e,l), do: freq(e,l,[])

  def freq(nil,_,acc), do: acc

  def freq([{k,f}|t],k,acc), do: freq(t,k,[{k,f+1}|acc])

  def freq([h|t],k,acc), do: freq(t,k,[h|acc])

  def fraq([]), do: []

  def fraq([h|t]), do: freq(h,fraq(t))

  def dillinger(), do: spawn(fn -> nyc() end)

  def nyc() do
    IO.puts("hey Jim")
    receive do
      :knife -> knife()
    end
  end

  def knife() do
    receive do
      :fork -> fork()
    end
  end

  def fork() do
    receive do
      :bottle -> bottle()
    end
  end

  def bottle() do
    receive do
      :cork -> nyc()
    end
  end

  def start(), do: spawn(fn -> closed() end)

  def closed() do
    receive do
      2 -> two()
      _ -> closed()
    end
  end

  def two() do
    receive do
      2->2
      4->four()
      _->closed()
    end
  end

  def four() do
    receive do
      2->two()
      6->six()
      _->closed()
    end
  end

  def six() do
    receive do
      2-> two()
      _->closed()
    end
  end

  def psum(:leaf, n),  do: n

  def psum(%{type: _, left: l, right: r}) do
    self=self()
    spawn(fn -> n1=psum(l); send(self, n1) end)
    spawn(fn -> n2=sum(r); send(self, n2) end)

    receive do
      s1 ->
        receive do
          s2 ->
            s1+s2
        end
    end
  end
  
  def fib(n), do: fib(n,0)

  def fib(0,acc), do: acc

  def fib(n,acc), do: fib(n-1,acc+(n-1)+(n-2))



end
