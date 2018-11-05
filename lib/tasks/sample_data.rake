namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
    #make_users
    #make_languages
    make_speeches
  end
end

def make_users
	admin=User.create!(name: "Example User",
								email: "example@exam.org",
								password: "foobar",
								password_confirmation: "foobar",
								admin: true )
	99.times do |n|
		name=Faker::Lebowski.character
		email="example-#{n+1}@exam.org"
		password="password"
		User.create!(name: name,
							 	email: email,
							 	password: password,
							 	password_confirmation: password)
	end
end

def make_languages
	6.times do
	  name=Faker::ElderScrolls.race
		Language.create!(name: name)
	end
end

def make_speeches
	users=User.all
	language=Language.first
	users.each {|user| user.learn_language!(language.id)}
end