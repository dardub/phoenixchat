defmodule Phoenixchat.User do
  use Phoenixchat.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string
    field :username, :string
    field :first_name, :string
    field :last_name, :string
    field :clear_password, :string, virtual: true

    timestamps()
  end

  def registration_changeset(struct, params) do
    struct
    |> changeset(params)
    |> cast(params, ~w(clear_password), [])
    |> validate_length(:clear_password, min: 6, max: 100)
    |> put_encrypted_password
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :username, :first_name, :last_name])
    |> validate_required([:email, :username, :first_name, :last_name])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:username, min: 1, max: 20)
    |> update_change(:email, &String.downcase/1)
    |> update_change(:username, &String.downcase/1)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end

  defp put_encrypted_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{clear_password: pass}} -> put_change(changeset, :password, Comeonin.Bcrypt.hashpwsalt(pass)) 
        _ -> changeset
    end
  end
end
