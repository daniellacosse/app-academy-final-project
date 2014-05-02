# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
   f_name = Faker::Name.first_name
   l_name = Faker::Name.last_name
  
  a_user = User.create(
    username: "#{f_name}_#{l_name}",
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    is_verified: true,
    date_of_birth: Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f)),
    first_name: f_name,
    last_name: l_name, 
    country: Faker::Address.country,
    gender: ["M", "F", "O", "n/a"].sample,
    avatar: "http://lorempixel.com/200/200",
    biography: Faker::Lorem.paragraph
  )
  
  rand(10).times do
    a_user.journals.create(
      title: Faker::Lorem.word,
      body: Faker::Lorem.paragraph
    )
  end
  
  rand(10).times do
    a_user.deviations.create(
      title: Faker::Lorem.word,
      description: Faker::Lorem.paragraph,
      media: "http://lorempixel.com/#{rand(400..1200)}/#{rand(400..1200)}",
      is_mature: false,
      is_commentable: true,
      is_shareable: true,
      is_likeable: true,
      is_DRM: false,
      is_CC: false,
      can_remix: true                  
      # tags: [].tap { |array| rand(5).times { array << Faker::Lorem.word} }.join(", ")
    )
  end
end

  # custom people
  
thomas = User.create({
  username: "theGreatBoguszewski",
  email: "thomasboguszewski@gmail.com",
  password: "thomasb",
  is_verified: true,
  date_of_birth: "1991-23-6",
  first_name: "Thomas",
  last_name: "Boguszewski", 
  country: "United States",
  gender: "M",
  avatar:  "https://fbcdn-sphotos-d-a.akamaihd.net/hphotos-ak-ash3/t1.0-9/575275_3772522569434_1815005096_n.jpg",
  biography: "I AM an all-around artist who is deeply invested in collaborating with other all-around artists to make a bunch of random shit to show everybody else and maybe convince them to become all-around artists too. There, that should just about cover it."
})