defmodule Chopstick do

  def start() do
    spawn_link(available())
  end

  def available() do
    receive do
      {:request, pid} -> send(pid, :taken)
      gone()
      :quit -> :ok
    end
  end

  def gone() do
    receive do
      :return -> available()
      :quit -> :ok
    end
  end

  def request(stick) do
    send(stick,{:request, self()})
    receive do
      :taken -> :ok
    end
  end

end
