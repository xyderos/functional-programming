defmodule Philosopher do

  @sleeping 1000
  @eating 1000
  @waiting 1000
  @timeout 1000

  def sleep(0) do :ok end

  def sleep(t), do: :timer.sleep(:rand.uniform(t))

  def start(hunger, right, left, name, ctrl), do: spawn_link(dream(hunger, right, left, name, ctrl))

  def dreaming(hunger, right, left, name, ctrl) when hunger>0  do
    sleep(@sleeping)
    eat(hunger, right, left, name, ctrl)
  end

  def dreaming(hunger, right, left, name, ctrl) when hunger==0 , do: send(ctrl, :quit)

  def waiting(hunger, right, left, name, ctrl) do
    sleep(@waiting)
    eating(hunger, right, left, name, ctrl)
  end

  def eating(hunger, right, left, name, ctrl) do
    sleep(@waiting)

    case Chopstick.request(left) do
      :ok ->
        case Chopstick.request(right) do
          :ok -> sleep(@eating)
          dreaming(hunger, right, left, name, ctrl)
          _ -> dreaming(hunger, right, left, name, ctrl)
        end
      _ -> dreaming(hunger, right, left, name, ctrl)
    end
  end
end
