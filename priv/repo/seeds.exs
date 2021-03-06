# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     KodeChan.Repo.insert!(%KodeChan.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

require Jason
require Logger
alias KodeChan.Repo

Repo.delete!(%KodeChan.Accounts.User{id: 69})

# user = Repo.insert!(%KodeChan.Accounts.User{name: "John Doe", id: 69})
# post = Ecto.build_assoc(user, :posts, %{title: "Welcome to KodeChan", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."})
# Repo.insert!(post)
