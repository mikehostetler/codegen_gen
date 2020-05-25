defmodule CodegenGen.CMS.Codegen do
  @moduledoc """
  The CMS context.
  """
  import Ecto.Query, warn: false
  alias CodegenGen.Repo
  alias CodegenGen.CMS.Post

  @callback list_posts :: []
  @callback get_post!(id :: integer) :: %Post{} | Ecto.NoResultsError
  @callback create_post(any()) :: any()
  @callback update_post(%Post{}, %{}) :: any()
  @callback delete_post(%Post{}) :: any()
  @callback change_post(%Post{}, any()) :: any()

  defmacro __using__([]) do
    quote do
      @behaviour CodegenGen.CMS.Codegen

      @impl CodegenGen.CMS.Codegen
      def list_posts(), do: CodegenGen.CMS.Codegen.list_posts(__MODULE__)

      @impl CodegenGen.CMS.Codegen
      def get_post!(id), do: CodegenGen.CMS.Codegen.get_post!(__MODULE__, id)

      @impl CodegenGen.CMS.Codegen
      def create_post(attrs \\ %{}), do: CodegenGen.CMS.Codegen.create_post(__MODULE__, attrs)

      @impl CodegenGen.CMS.Codegen
      def update_post(%Post{} = post, attrs \\ %{}),
        do: CodegenGen.CMS.Codegen.update_post(__MODULE__, post, attrs)

      @impl CodegenGen.CMS.Codegen
      def delete_post(%Post{} = post),
        do: CodegenGen.CMS.Codegen.delete_post(__MODULE__, post)

      @impl CodegenGen.CMS.Codegen
      def change_post(%Post{} = post, attrs \\ %{}),
        do: CodegenGen.CMS.Codegen.change_post(__MODULE__, post, attrs)

      defoverridable CodegenGen.CMS.Codegen
    end
  end

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts(_module) do
    Repo.all(Post)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(_module, id), do: Repo.get!(Post, id)

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(_module, attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(_module, %Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(_module, %Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(_module, %Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end
end
