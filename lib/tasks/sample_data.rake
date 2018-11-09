namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
    make_users
    make_languages
    make_speeches
  end
end

def random_avatars
	avatars=%w[Bionik1.jpg CHasovoy2.jpg Farmakolog1.jpg Injener3.jpg Izvlechenie.jpg Kibernetik1.jpg Materialoved1.jpg Medrabotnik3.jpg Mehanotronik1.jpg Perevodchik.jpg Spetsialis2.jpg Spetsialist.jpg Sportsmen1.jpg Strelok1.jpg Zoolog1.jpg]
	avatar=avatars[rand(avatars.size)]
end

def make_users
	admin=User.create!(name: "Example User",
								email: "example@exam.org",
								password: "foobar",
								password_confirmation: "foobar",
								admin: true )
	99.times do |n|
		name=Faker::Name.name
		email="example-#{n+1}@exam.org"
		password="password"
		avatar=random_avatars
		User.create!(name: name,
							 	email: email,
							 	password: password,
							 	password_confirmation: password,
								avatar: avatar)
	end
end

def make_languages
	5.times do
	  name=Faker::ElderScrolls.race
		Language.create!(name: name)
	end
end

def make_speeches
	users=User.all
	languages=Language.all
	languages.each do
		|language|
		users.each {|user| user.learn_language!(language)}
	end
end