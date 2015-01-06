# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

eta = PledgeClass.create(
	name: "Eta",
	pledge_semester: DateTime.new(2014, 9, 1, 0, 0, 0)
	)
gamma = PledgeClass.create(
	name: "gamma",
	pledge_semester: DateTime.new(2012, 9, 1, 0, 0, 0)
	)


user = Brother.create(
	name: "Aryan Falahatpisheh",
	pledge_class: eta,
	grad_year: DateTime.new(2017, 5, 15, 20, 10, 0),
	description: "Aryan is a cool dude I guess",
	image_url: "brothers/Aryan_Falahatpisheh.jpg",
	major: "Computer Science")
user.save

user = Brother.create(
	name: "Jasmine Stoy",
	pledge_class: gamma,
	grad_year: DateTime.new(2016, 5, 15, 20, 10, 0),
	description: "I agree that Aryan is cool",
	image_url: "brothers/Jasmine_Stoy.jpg",
	major: "Business Administration")
user.save

user = Brother.create(
	name: "Anant Agarwal",
	pledge_class: gamma,
	grad_year: DateTime.new(2016, 05, 15, 20, 10, 0),
	description: "Yeah no that guy's hot",
	image_url: "brothers/Anant_Agarwal.jpg",
	major: "Economics")
user.save
