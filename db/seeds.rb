user = User.create([{ name: "Bob Hope" }, { email: "bob@bob.com" }, { password: "password" }, { password_confirmation: "password" }])
user = User.create([{ name: "Katy Perry" }, { email: "katy@katy.com" }, { password: "password" }, { password_confirmation: "password" }])

todo = Todo.create([{ user_id: 1 }, { title: "laundry" }, { description: "do laundry" }, { deadline: "2023-12-31" }, { category_id: 1 }])
todo = Todo.create([{ user_id: 1 }, { title: "dishes" }, { description: "do dishes" }, { deadline: "2023-12-31" }, { category_id: 1 }])

category = Category.create([{ name: "Cleaning" }])
category = Category.create([{ name: "Homework" }])
