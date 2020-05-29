# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_sebas = User.create!(username:"Sebas", email:"sebas@gmail.com", password:"123456")
user_wilber = User.create!(username:"Wilber", email:"wilber@gmail.com", password:"123456")
user_diego = User.create!(username:"Diego", email:"diego@gmail.com", password:"123456")
cat_gatos = Category.create!(name:"gatos")
cat_perros = Category.create!(name:"perros")
meme_gato = user_sebas.memes.create!(title:"Meme de gato",meme_type:"image",url_source:"gatos.png",category_id:cat_gatos.id)
meme_perro = user_wilber.memes.create!(title:"Meme de perro",meme_type:"gif",url_source:"perros.jpg",category_id:cat_perros.id)
user_diego.voted_memes << meme_gato
user_diego.voted_memes << meme_perro
comment_gato = meme_gato.comments.create!(body: "Buen meme, Sebas",user_id:user_wilber.id)
comment_pero = meme_perro.comments.create!(body: "Gran meme, Wilber",user_id:user_sebas.id)