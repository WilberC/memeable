# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user_sebas = User.create!(username:"Sebas", email:"sebas@gmail.com", password:"123456")
# user_wilber = User.create!(username:"Wilber", email:"wilber@gmail.com", password:"123456")
# user_diego = User.create!(username:"Diego", email:"diego@gmail.com", password:"123456")
# cat_gatos = Category.create!(name:"gatos")
# cat_perros = Category.create!(name:"perros")
# meme_gato = user_sebas.memes.create!(title:"Meme de gato",meme_type:"image",url_source:"gatos.png",category_id:cat_gatos.id)
# meme_perro = user_wilber.memes.create!(title:"Meme de perro",meme_type:"gif",url_source:"perros.jpg",category_id:cat_perros.id)
# user_diego.voted_memes << meme_gato
# user_diego.voted_memes << meme_perro
# comment_gato = meme_gato.comments.create!(body: "Buen meme, Sebas",user_id:user_wilber.id)
# comment_pero = meme_perro.comments.create!(body: "Gran meme, Wilber",user_id:user_sebas.id)
require 'faker'
puts "Creating users"
User.create!(username: "test", email: "test@mail.com", password: "123456", password_confirmation: "123456")
10.times do
  username = Faker::Internet.username
  email = Faker::Internet.email(name: username)
  User.create!(username: username, email: email, password: "123456", password_confirmation: "123456")
end
puts "Creating memes, cateogories and tags"
memes = [
  {
    title: "Completnees",
    meme_type: "image",
    url_source: "https://www.siliconrepublic.com/wp-content/uploads/2015/05/Project-completeness-over-time.png",
    category: "Developer",
    tags: %w(time, funny, developes, work)
  },
  {
    title: "Bug",
    meme_type: "image",
    url_source: "https://www.siliconrepublic.com/wp-content/uploads/2015/05/Bug-v-feature.jpg",
    category: "Developer",
    tags: %w(bugs, funny, developes)
  },
  {
    title: "Genders",
    meme_type: "image",
    url_source: "https://www.siliconrepublic.com/wp-content/uploads/2015/05/Female-Male-Programmer.png",
    category: "Developer",
    tags: %w(gender, developes)
  },
  {
    title: "Developer on the wild",
    meme_type: "image",
    url_source: "https://www.siliconrepublic.com/wp-content/uploads/2015/05/Tigers.png",
    category: "Developer",
    tags: %w(lion, developes, clients, managers)
  },
  {
    title: "Terminal programmer",
    meme_type: "gif",
    url_source: "https://media.giphy.com/media/iIqmM5tTjmpOB9mpbn/giphy.gif",
    category: "Developer",
    tags: %w(terminal, shell, developes)
  },
  {
    title: "Chemistry Cat",
    meme_type: "image",
    url_source: "https://i.pinimg.com/474x/73/3b/4e/733b4e32ec8db020292aac0ba81cb588--chemistry-jokes-science-jokes.jpg",
    category: "Science",
    tags: %w(cat, chemestry, science)
  },
  {
    title: "Keep calm and put your lab coat on",
    meme_type: "image",
    url_source: "https://i.pinimg.com/474x/2d/78/83/2d78833d67849b89c06d0dd7b3a1d70a--medical-laboratory-science-laboratory-humor.jpg",
    category: "Science",
    tags: %w(lab, england, calm)
  },
  {
    title: "Love, It's a Chemical",
    meme_type: "image",
    url_source: "https://i.pinimg.com/474x/fb/b1/04/fbb104b5db3772ff601ad8238ccc2171--dopamine-tattoo-google-search.jpg",
    category: "Science",
    tags: %w(love, formula, science)
  },
  {
    title: "Sad football player",
    meme_type: "image",
    url_source: "https://i.pinimg.com/474x/73/3a/c7/733ac718dd95a06e4de1c78a55d6b86f--funny-sports-memes-nfl-memes.jpg",
    category: "Sports",
    tags: %w(sad, superball, football)
  },
  {
    title: "Confuse athlete",
    meme_type: "image",
    url_source: "https://i.pinimg.com/474x/f4/60/cb/f460cb94a685511ccd353f859dd4f203.jpg",
    category: "Sports",
    tags: %w(funny, athlete)
  },
  {
    title: "Vader home run",
    meme_type: "gif",
    url_source: "https://media.giphy.com/media/LEUEbtICrpFE4/giphy.gif",
    category: "Star Wars",
    tags: %w(vade, homerun, baseball)
  },
  {
    title: "Vader dancing",
    meme_type: "gif",
    url_source: "https://media.giphy.com/media/1HPUSulSOHDpe/giphy.gif",
    category: "Star Wars",
    tags: %w(vade, dance, troopers)
  },
  {
    title: "Troopers dancing",
    meme_type: "gif",
    url_source: "https://media.giphy.com/media/bVuDlIxG65K8w/giphy.gif",
    category: "Star Wars",
    tags: %w(starwars, dance, troopers)
  }
]
users = User.all
memes.each do |meme|
  user = users.sample
  meme_data = meme.slice(:title, :meme_type, :url_source)
  meme_data[:category] = Category.find_or_create_by!(name: meme[:category])
  meme_data[:owner] = user
  meme_data[:created_at] = rand(1..5).days.ago	
  new_meme = Meme.create!(meme_data)
#   meme[:tags].each do |tag_name|
#     tag = Tag.find_or_create_by(name: tag_name)
#     new_meme.tags << tag
#   end
end
memes = Meme.all
puts "Create votes"
users.each do |user|
  memes_to_vote = memes.sample(rand(0..10))
  memes_to_vote.each do |meme|
    meme.votes.create!(user: user)
  end
end
puts "Create comments"
users.each do |user|
  memes_to_comment = memes.sample(rand(0..10))
  memes_to_comment.each do |meme|
    body = Faker::Quote.robin
    meme.comments.create!(body: body, user: user)
  end
end