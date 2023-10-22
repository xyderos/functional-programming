defmodule Test do

  def fairly(t), do: fairly(t,0,0)

  def fairly({:tree,_,l,_}, lacc, racc), do: fairly(l,lacc+1,racc)

  def fairly({:tree,_,nil,r},lacc,racc), do: fairly(r,lacc,racc+1)

  def fairly({:tree,_,nil,nil},lacc,racc) when abs(lacc-racc)<2 , do: {:ok, max(lacc,racc)}

  def findOrdered(nil, _), do: {:notfound}

  def findOrdered({:tree,v,_,_},v), do: {:ok, v}

  def findOrdered({:tree,e,_,r},v) when v>e , do: findOrdered(r,v)

  def findUnordered({:tree,v,_,_},v,_), do: {:ok, v}

  def findUnordered(nil,_), do: :notfound

  def findUnordered({:tree,_,l,r},v) do

    self=self()

    spawn(fn() -> a1=findUnordered(l,v); send(self,a1) end)

    spawn(fn() -> a2=findUnordered(r,v); send(self,a2) end)

    receive do
      {:ok,_} -> :found
      _->
        receive do
          {:ok, _} -> :ok
          _ -> :notfound
        end
        _-> :notfound
    end
  end

  def modify(nil,_,_), do: nil

  def modify({:tree,k,_,l,r},k,v), do: {:tree, k,v,l,r}

  def modify({:tree,k,v1,l,r},k1,v) when k1>k , do: {:tree,k,v1,l,modify(r,k,v)}

  def modify({:tree,k,v1,l,r},k1,v) when k1<k , do: {:tree,k,v1,modify(l,k,v),r}

  def delete({:tree,k,v,l,r},k1) when k1>k, do: {:tree, k,v,l,delete(r,k1)}

  def delete({:tree,k,v,l,r},k1) when k1<k, do: {:tree, k,v,delete(l,k1),r}

  def delete({:tree,k,_,nil,r},k), do: r

  def delete({:tree,k,_,l,nil},k), do: l

  def delete({:tree,k,_,l,r},k), do: {:tree,min(r), l,min(delete(r,min(r)))}

  def min({:tree,v,_,_}), do: v

  def min({:tree,_,l,_,}), do: min(l)

  def foldp(l,lambda) do

    self=self()

    {l1,l2}=split(l)

    spawn(fn()->a1=res(l1,lambda); send(self,a1) end)

    spawn(fn()->a2=res(l2,lambda); send(self,a2) end)

    receive do
      a1 ->
        receive do
          a2 -> a1 ++ a2
        end
    end

  end

  def res(l,f), do: res(l,f,[])

  def res([],_,acc), do: acc

  def res([h|t], f, acc), do: res(t,f,acc ++ [f.(h)])

  def split(l), do: split(l,[],[])

  def split([], acc1,acc2), do: {acc1,acc2}

  def split([h|t], acc1,acc2), do: split(t,acc2,acc1++[h])

  def once(l), do: once(l,0,0)

  def once([],ac1,ac2), do: {:ok,ac1,ac2}

  def once([h|t],acc1,acc2), do: once(t,acc1+h,acc2+1)

  def ackerman(0,n), do: n+1

  def ackerman(m,0) when m>0 , do: ackerman(m-1,1)

  def ackerman(m,n), do: ackerman(m-1,ackerman(m,n-1))

  def eEx(l), do: eEx(l,[])

  def eEx([],acc), do: acc

  def eEx([h|t],_), do: eEx(t,h)

  def eEx([h|[h1|t1]], acc) when h=='+' , do: eEx(t1,acc+h1)

  def eEx([h|[h1|t1]], acc) when h=='-' , do: eEx(t1,acc-h1)

  def isomorphic(nil,nil), do: true

  def isomorphic(_,_), do: false

  def isomorphic({:tree,_,l1,r1},{:tree,_,l2,r2}), do: isomorphic(r1,r2) && isomorphic(l1,l2)

  def mirror(nil), do: nil

  def mirror({:tree,v,l,r}), do: {:tree,v,mirror(r),mirror(l)}

  def reduce(l), do: reduce(l,[])

  def reduce([],acc), do: acc

  def reduce([h|[h|t1]],acc), do: reduce(t1,acc)

  def reduce([h|[h1|t1]], acc), do: reduce(t1,acc++[h]++[h1])

  def triss(l), do: triss(Enum.sort(l),0)

  def triss([],_), do: false

  def triss(_,3), do: true

  def triss([h|[h|t1]], acc), do: triss(t1,acc+1)

  def triss([_|[_|_]=t],_), do: triss(t,0)

  def toList(nil), do: []

  def toList({:heap,v,{:heap,v1,_,_}=l,{:heap,v2,_,_}=r}) when v2>v1, do: [v] ++ toList(r) ++ toList(l)

  def toList({:heap,v,{:heap,v1,_,_}=l,{:heap,v2,_,_}=r}) when v2<v1, do: [v] ++ toList(l) ++ toList(r)

  def poppin(nil), do: false

  def poppin({:heap,v,nil,r}), do: {:heap,v,r}

  def poppin({:heap,v,l,nil}), do: {:heap,v,l}

  def poppin({:heap,v,{:heap,vl,_,_}=l,{:heap,vr,_,_}=r}) when vl<vr , do: {:heap,v,poppin(l),r}

  def poppin({:heap,v,{:heap,vl,_,_}=l,{:heap,vr,_,_}=r}) when vl>vr , do: {:heap,v,l,poppin(r)}

  def freq(l,e), do: freq(l,e,0)

  def freq([],_,acc), do: acc

  def freq([e|t],e,acc), do: freq(t,e,acc+1)

  def freq([_|t],e,acc), do: freq(t,e,acc)

  def exists([],_), do: nil

  def exists([e|_],e), do: true

  def exists([_|t], e), do: exists(t,e)

  def isort(l), do: isort(l,[])

  def isort([],acc), do: acc

  def isort([h|t],acc), do: isort(t,insert(h,acc))

  def insert(e,l), do: insert(e,l,[])

  def insert(last,[], acc), do: acc ++ [last]

  def insert(e,[h|t],acc) when e>h, do: insert(e,t,acc ++ [h])

  def insert(e,[h|t],acc) when e<h , do: insert(h,t,acc ++ [e])

  def msort(l), do: msort(split(l),[])

  def msort({[],[]}, acc), do: acc

  def msort({[],r},acc), do: msort(r,acc)

  def msort({l,[]},acc), do: msort(l,acc)

  def msort({[h1|t1],[h2|_]=l2}, acc) when h1<h2 , do: msort({t1,l2},acc ++ [h1])

  def msort({[h1|_]=l1,[h2|t2]}, acc) when h2<h1 , do: msort({l1,t2},acc ++ [h2])

  def add(a,b), do: a+b

end
