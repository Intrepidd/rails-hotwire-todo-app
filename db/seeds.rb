# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

todos = [
  { name: "Try out Turbo Morphing", completed: true },
  { name: "Add View Transitions to the app", completed: true },
  { name: "Build inline editing with Turbo Frames", completed: false },
  { name: "Deploy with Kamal", completed: false },
  { name: "Read the Rails 8 release notes", completed: false },
  { name: "Explore Solid Queue for background jobs", completed: false }
]

todos.each do |attrs|
  Todo.find_or_create_by!(name: attrs[:name]) do |todo|
    todo.completed = attrs[:completed]
  end
end
