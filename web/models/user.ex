defmodule TodoApp.User do
  use TodoApp.Web, :model

  schema "users" do
    field :name, :string
    field :role, :string
    field :password_hash, :string
    has_many :todos, TodoApp.Todo

    timestamps
  end

  @required_fields ~w(name role password_hash)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:name, on: Repo)
  end
end
