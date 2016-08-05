# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# Create users
User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all
Account.destroy_all
Tag.destroy_all

user_list = [
  ["Matt", "abc123"],
  ["Tim", "abc123"]
]
user_list.each do |user, password|
  User.create(login: user, password: password)
end

# Make some accounts
account_list = [
  ["male", 25, "Max", "Doe"],
  ["male", 25, "Simon", "Doe"]
]
account_list.each do |gender, age, fname, lname|
  Account.create(gender: gender, age: age, first_name: fname, last_name: lname)
end

# Make some to-do lists
todo_list = [
  ["Disney Land", "2016-3-14"],
  ["Summer Soccer Tour", "2014-2-5"],
  ["Wedding", "2011-6-29"],
  ["Business Trip to Alaska", "2015-1-1"],
  ["Honeymoon", "2015-5-25"],
  ["Homework", "2016-9-9"],
  ["Group Project", "2017-12-25"],
  ["Graduation", "1990-2-22"]
]
todo_list.each do |name, due|
  TodoList.create(list_name: name, list_due_date: due)
end

user = User.find_by login: "Matt"
200.times {|index| 	user.todo_lists << TodoList.create(list_name: "Name#{index}", list_due_date: "#{index}-01-01")}

long_list = user.todo_lists.find_by list_name: "Name1"
200.times {|index|  long_list.todo_items << TodoItem.create(due_date: "#{index}-01-01", task_title: "title", description: "desc", done: false)}

# Make some to-do items
todo_items = [
  ["2016-1-14", "Tickets", "Buy tickets", false],
  ["2016-2-14", "Hotel", "Reserve hotel", false],
  ["2016-3-13", "Car", "Bring the car to mechanic", false],
  ["2013-11-5", "LFC Tickets", "Buy Liverpool tickets", false],
  ["2014-12-5", "Plane", "Buy plane tickets", false],
  ["2014-1-5", "Beer", "Save beer money", false],
  ["2011-4-29", "Suit", "Rent suit", false],
  ["2011-5-29", "RSVP", "Send RSVP", false],
  ["2014-11-1", "Gun", "Buy hunting rifle", false],
  ["2014-12-1", "Coat", "Buy a really warm coat", false],
  ["2014-5-25", "Wedding", "Get married", false],
  ["2014-6-25", "Plan", "Plan honeymoon", false],
  ["2016-5-9", "Assignment 1", "Complete assignment 1", false],
  ["2016-6-9", "Assignment 2", "Complete assignment 2", false],
  ["2016-7-9", "Assignment 3", "Complete assignment 3", false],
  ["2017-10-25", "Plan project", "Come up with project idea", false],
  ["2017-11-25", "Assign work", "Dish out jobs", false],
  ["2017-11-24", "Demo", "Present demo", false],
  ["1990-2-22", "Walk", "Walk across the stage", false]
]
todo_items.each do |due, title, desc, done|
  TodoItem.create(due_date: due, task_title: title, description: desc, done: done)
end

# Tags
tag_list = [
  "Business Trips",
  "Vacations",
  "School",
  "Family",
  "Friends"
]
tag_list.each do |name|
  Tag.create(tag_name: name)
end

# Link TodoItems to Tags
TodoItem.all.each do |item|
  if item.task_title == "Hotel" or 
      item.task_title == "Car" or
      item.task_title == "Plane" or
      item.task_title == "Gun" or
      item.task_title == "Coat"
    item.tags << Tag.find_by(tag_name: "Business Trips")
  elsif item.task_title == "Tickets" or
      item.task_title == "Hotel" or
      item.task_title == "Car" or
      item.task_title == "LFC Tickets" or
      item.task_title == "Beer" or
      item.task_title == "Plane"
    item.tags << Tag.find_by(tag_name: "Vacations")
  elsif item.task_title == "Assignment 1" or
      item.task_title == "Assignment 2" or
      item.task_title == "Assignment 3" or
      item.task_title == "Plan project" or
      item.task_title == "Assign work" or
      item.task_title == "Demo" or
      item.task_title == "Walk"
    item.tags << Tag.find_by(tag_name: "School")
  elsif item.task_title == "Tickets" or
      item.task_title == "Car" or
      item.task_title == "Plane" or
      item.task_title == "Plan" or
      item.task_title == "Suit" or
      item.task_title == "RSVP" or
      item.task_title == "Wedding"
    item.tags << Tag.find_by(tag_name: "Family")
    item.tags << Tag.find_by(tag_name: "Friends")
  end
end

# Link TodoItems to TodoLists
TodoList.all.each do |list|
  if list.list_name == "Disney Land"
    list.todo_items << TodoItem.find(1)
    list.todo_items << TodoItem.find(2)
    list.todo_items << TodoItem.find(3)
  elsif list.list_name == "Summer Soccer Tour"
    list.todo_items << TodoItem.find(2)
    list.todo_items << TodoItem.find(4)
    list.todo_items << TodoItem.find(5)
    list.todo_items << TodoItem.find(6)
  elsif list.list_name == "Wedding"
    list.todo_items << TodoItem.find(7)
    list.todo_items << TodoItem.find(8)
  elsif list.list_name == "Business Trip to Alaska"
    list.todo_items << TodoItem.find(9)
    list.todo_items << TodoItem.find(10)
  elsif list.list_name == "Honeymoon"
    list.todo_items << TodoItem.find(11)
    list.todo_items << TodoItem.find(12)
  elsif list.list_name == "Homework"
    list.todo_items << TodoItem.find(13)
    list.todo_items << TodoItem.find(14)
    list.todo_items << TodoItem.find(15)
  elsif list.list_name == "Group Project"
    list.todo_items << TodoItem.find(16)
    list.todo_items << TodoItem.find(17)
    list.todo_items << TodoItem.find(18)
  elsif list.list_name == "Graduation"
    list.todo_items << TodoItem.find(19)
  end
end

# Link Users to TodoLists
User.all.each do |user|
  if user.login == "Tim"
    user.todo_lists << TodoList.find(1)
    user.todo_lists << TodoList.find(6)
  elsif user.login == "Matt"
    user.todo_lists << TodoList.find(2)
    user.todo_lists << TodoList.find(3)
    user.todo_lists << TodoList.find(8)
    user.todo_lists << TodoList.find(4)
    user.todo_lists << TodoList.find(5)
    user.todo_lists << TodoList.find(7)
  end
end

# Link Users to Accounts
User.find(1).account = Account.find(1);
User.find(2).account = Account.find(2);

