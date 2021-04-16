puts "Clearing old data..."
Category.destroy_all
Task.destroy_all

puts "Seeding Categories..."

food = Category.create(name: "Food")
money = Category.create(name: "Money")
misc = Category.create(name: "Misc")
code = Category.create(name: "Code")

puts "Seeding tasks..."

Task.create(text: "Buy Rice", category_id: food.id)
Task.create(text: "Save a tenner", category_id: money.id)
Task.create(text: "Build a todo app", category_id: misc.id)
Task.create(text: "Build todo API", category_id: misc.id)
Task.create(text: "Get an ISA", category_id: money.id)
Task.create(text: "Cook rice", category_id: food.id)
Task.create(text: "Tidy house", category_id: misc.id)
Task.create(text: "Code", category_id: misc.id)
Task.create(text: "Save a tenner", category_id: money.id)

puts "Done!"
