# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Deviation.delete_all
Gallery.delete_all
GalleryDeviation.delete_all
Journal.delete_all
Tag.delete_all
Comment.delete_all
View.delete_all
Norification.delete_all
Message.delete_all

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
      body: Faker::Lorem.paragraph(rand(8..12))
    )
  end

  rand(10).times do
    a_dev = a_user.deviations.create(
      title: Faker::Lorem.word,
      description: Faker::Lorem.paragraph,
      media: "http://lorempixel.com/#{rand(400..1200)}/#{rand(400..1200)}",
      is_mature: false,
      is_commentable: true,
      is_shareable: true,
      is_likeable: true,
      is_DRM: false,
      is_CC: false,
      can_remix: true,
      created_at: Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f))
    )

    rand(4).times do
      a_dev.tags.create(
        tag: ["cool", "neat", "good", "great", "art", "nice", "far_out"].sample
      )
    end
  end
end