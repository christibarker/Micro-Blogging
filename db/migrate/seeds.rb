lucy = User.create(name: 'Lucy', email: 'lucy@gmail.com', password: 'lucy')
george = User.create(name: 'George' email: 'george@gmail.com', password: 'george'))
christi = User.create(name: 'Christi' email: 'christi@gmail.com', password: 'christi'))

lucy.posts.create(content: 'Never eat at a restaurant with neon lights, they are tourist traps.')
lucy.posts.create(content: 'Spanish steps where a disappointment however, great shopping in the area!')

george.posts.create(content: 'Many people stick their feet in the fountains to cool off during the heat of the summer.')

christi.posts.create(content: 'You can take a tour of the top of St. Peters Basilica.')