# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = Brother.create(
	name: "Aryan Falahatpisheh",
	pledge_class: "Eta",
	grad_year: DateTime.new(2017, 05, 15, 20, 10, 0),
	description: "Aryan is a cool dude I guess",
	image_url: "brothers/Aryan_Falahatpisheh.jpg",
	major: "Computer Science")
user.save

user = Brother.create(
	name: "Jasmine Stoy",
	pledge_class: "Gamma",
	grad_year: DateTime.new(2016, 05, 15, 20, 10, 0),
	description: "I agree that Aryan is cool",
	image_url: "brothers/Jasmine_Stoy.jpg",
	major: "Business Administration")
user.save

user = Brother.create(
	name: "Anant Agarwal",
	pledge_class: "Gamma",
	grad_year: DateTime.new(2016, 05, 15, 20, 10, 0),
	description: "Yeah no that guy's hot",
	image_url: "brothers/Anant_Agarwal.jpg",
	major: "Economics")
user.save
