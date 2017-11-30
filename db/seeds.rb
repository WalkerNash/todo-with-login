User.destroy_all
List.destroy_all
user = User.create(username: 'bj')
user.lists.create(title: 'Homework')
user.lists.create(title: 'Projects')
user.lists.create(title: 'Misc Stuff')
