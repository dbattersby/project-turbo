# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create([
  { username: "sarah", email: "sarah@example.com", password: "Password123" },
  { username: "jane", email: "jane@example.com", password: "Password123" },
  { username: "mark", email: "mark@example.com", password: "Password123" },
  { username: "john", email: "john@example.com", password: "Password123" }
])
