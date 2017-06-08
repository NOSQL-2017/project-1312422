User.delete_all
Article.delete_all

phat = User.create(username: 'phat', password:'123456', email:'phatduynguyen@gmail.com')
dat = User.create(username: 'dat', password:'123456', email:'dat@gmail.com')

Article.create!(name:'Art1', author_id: phat.id)
Article.create!(name:'Art2', author_id: dat.id)