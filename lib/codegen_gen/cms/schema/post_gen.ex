defmodule CodegenGen.CMS.Post.Codegen do
  use Ecto.Schema
  import Ecto.Changeset

  @callback changeset(any(), any()) :: Ecto.Changeset

  defmacro __using__([]) do
    quote do
      use Ecto.Schema
      import Ecto.Changeset

      schema "posts" do
        field :body, :string
        field :published, :boolean, default: false
        field :title, :string

        timestamps()
      end

      @behaviour CodegenGen.CMS.Post.Codegen

      @impl CodegenGen.CMS.Post.Codegen
      def changeset(post, attrs),
        do: CodegenGen.CMS.Post.Codegen.changeset(__MODULE__, post, attrs)

      defoverridable CodegenGen.CMS.Post.Codegen
    end
  end

  @doc false
  def changeset(_module, post, attrs) do
    post
    |> cast(attrs, [:title, :body, :published])
    |> validate_required([:title, :body, :published])
  end
end
