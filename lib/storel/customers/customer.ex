defmodule Storel.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "customers" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    field :role, :string, default: "user"

    timestamps()
  end

  defp hash_password(
         %Ecto.Changeset{
           valid?: true,
           changes: %{password: password}
         } = changeset
       ) do
    change(changeset, Argon2.add_hash(password))
  end

  defp hash_password(changeset), do: changeset

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [
      :email,
      :password,
      :password_confirmation,
      :password_hash,
      :role,
      :first_name,
      :last_name
    ])
    |> validate_required([
      :email,
      :password,
      :password_confirmation,
      :role,
      :first_name,
      :last_name
    ])
    |> unique_constraint(:email, message: "email already exists")
    |> update_change(:first_name, &String.capitalize/1)
    |> update_change(:last_name, &String.capitalize/1)
    |> update_change(:email, &String.downcase/1)
    |> validate_format(:email, ~r/@/, message: "invalid email format")
    |> validate_length(:password,
      min: 6,
      max: 25,
      message: "invalid password length min: 6, max: 25"
    )
    |> validate_confirmation(:password, message: "the password are not equals")
    |> hash_password()
  end
end
