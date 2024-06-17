# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.create!([
  {
    name: "admin1", 
    password: "hellouniverse1!",
    password_confirmation: "hellouniverse1!"
  }, 
  {
    name: "admin2", 
    password: "hellouniverse2!",
    password_confirmation: "hellouniverse2!"
  }
])

User.create!([
  {
    name: "user1",
    password: "helloworld1!",
    password_confirmation: "helloworld1!"
  },
  {
    name: "user2",
    password: "helloworld2!",
    password_confirmation: "helloworld2!"
  }
])

Room.create!([
  {
    title: "C212",
    description: "21 PC with windows 11, AutoCAD",
    capacity: 21,
  },
  {
    title: "C213",
    description: "31 iMac with Adobe CC",
    capacity: 31,
  },
])

Course.create!([
  {
    title: "Introduction to SQL",
    slug: "CM429-07-2024-C",
    description: "Introduction to SQL",
    user_id: 1
  },
  {
    title: "Cross platform mobile App development with JavaScript",
    slug: "CM521-06-2024-C",
    description: "Cross platform mobile App development with JavaScript",
    user_id: 1
  },
  {
    title: "WeChat platform operation and article production",
    slug: "CM532-07-2024-C",
    description: "WeChat platform operation and article production",
    user_id: 1
  }, 
  {
    title: "Introduction to Python programming",
    slug: "CM540-06-2024-C",
    description: "Introduction to Python programming",
    user_id: 1,
    state: "published"
  },
  {
    title: "Web UI Design with Adobe XD",
    slug: "CM571-07-2024-C",
    description: "Web UI Design with Adobe XD",
    user_id: 2,
    state: "published"
  }
])

Lesson.create!([
  {
    course_id: 4,
    room_id: 1,
    date: "2024-06-03",
    from: "18:45",
    to: "21:45"
  },
  {
    course_id: 4,
    room_id: 1,
    date: "2024-06-06",
    from: "18:45",
    to: "21:45"
  }
])
