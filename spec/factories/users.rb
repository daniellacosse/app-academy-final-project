# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "MyString"
    email "MyString"
    password_digest "MyString"
    token "MyString"
    gender ""
    date_of_birth "2014-04-21"
    location "MyString"
    biography "MyText"
  end
end
