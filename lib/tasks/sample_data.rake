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

def make_errands
	10.times do
	  addres=Faker::Address.full_address
		Errand.create!(addres: addres)
	end
end

def make_departments
	10.times do
	  designation=Faker::Job.field
		Department.create!(designation: designation)
	end
end

def make_objectieves
	20.times do
	  description=Faker::Lorem.sentence
		Objective.create!(description: description)
	end
end

def make_rewards
	10.times do
	  title=Faker::Military.air_force_rank
		description=Faker::Lorem.sentence
		Reward.create!(title: title,
									 description: description)
	end
end

def make_ability
	20.times do
	  description=Faker::Hacker.ingverb
		Ability.create!(description: description)
	end
end

def make_charact
	grades=%w[1 2 3 4 5 6 7 8 9 10]
	grade=grades[rand(grades.size)]
	Characteristic.create!(grade: grade)
end

def make_users
	admin=User.create!(name: "Example User",
								email: "example@exam.org",
								password: "foobar",
								password_confirmation: "foobar",
								admin: true,
								employment_date: "2018-11-01")

	50.times do |n|
		name=Faker::Name.name
		email="example-#{n+1}@exam.org"
		password="password"
		avatar=random_avatars
		employment_date=Faker::Date.backward(50)
		User.create!(name: name,
							 	email: email,
							 	password: password,
							 	password_confirmation: password,
								avatar: avatar,
								employment_date: employment_date)
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