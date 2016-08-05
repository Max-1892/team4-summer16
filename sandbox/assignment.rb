require_relative '../config/environment'

# Step 4) of the homework: Access TodoItems directly from User
puts "\n"
puts "Step 4) of homework demonstration: Result of User.first.todo_items call:"
User.first.todo_items.each do |item|
  puts item.to_s
end

# Step 5) of the homework: Validate gender field of Account model so
# it only accepts 'male', 'female', 'N/A' and validate age field
# so it only accepts values between 20 and 100, inclusive.
puts "\n"
puts "Step 5) of homework demonstration: Result of setting the gender field of Account to 'boy':"
randomAccount = Account.new(gender: "boy", age: 19)
printf("Random account's gender = '%s'\n", randomAccount.gender)
printf("Is account valid? %s\n", randomAccount.valid?)
puts "Step 5) of homework demonstration: Result of setting the age field of Account to 19:"
printf("Random account's age = '%d'\n", randomAccount.age)
printf("Is account valid? %s\n", randomAccount.valid?)
puts "Step 5) of homework demonstration: Making random account valid"
randomAccount.gender = "male"
randomAccount.age = 20
printf("Random account's gender = '%s'\n", randomAccount.gender)
printf("Random account's age = '%d'\n", randomAccount.age)
printf("Is account valid? %s\n", randomAccount.valid?)

# Step 6) of the homework: Define a default scope for TodoList and TodoItem
# so they are ordered in ascending order based on due date.
puts "\n"
puts "Step 6) of the homework demonstration: Use default scope to print TodoList and TodoItem in acending order based on due date"
puts "Result of running TodoList.all:"
TodoList.all.each do |list|
  puts list.to_s
end
puts "Result of running TodoItem.all:"
TodoItem.all.each do |item|
  puts item.to_s
end
puts "\n"

# Extras: Retrieves demonstrating basic relationships
puts "Demonstrating other relationships:"
puts "\n"
puts "User with associated account:"
puts User.first.to_s
puts User.first.account.to_s

puts "\n"
puts "User with associated todo_lists:"
puts User.first.to_s
User.first.todo_lists.each do |todo_list|
	puts todo_list.to_s
end

puts "\n"
puts "User with associated todo_items from first todo list:"
puts User.first.to_s
TodoList.first.todo_items.each do |todo_item|
	puts todo_item.to_s
end

puts "\n"
puts "First todo_item with associated tags:"
TodoItem.first.tags.each do |tag|
	puts tag.to_s
end