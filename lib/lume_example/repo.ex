defmodule LumeExample.Repo do
  use Ecto.Repo,
    otp_app: :lume_example,
    adapter: Ecto.Adapters.SQLite3
end
