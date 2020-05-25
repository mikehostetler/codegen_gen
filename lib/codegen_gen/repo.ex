defmodule CodegenGen.Repo do
  use Ecto.Repo,
    otp_app: :codegen_gen,
    adapter: Ecto.Adapters.Postgres
end
