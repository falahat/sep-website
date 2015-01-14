# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'


alpha = PledgeClass.create(
	name: "alpha",
	pledge_semester: DateTime.new(2011, 9, 1, 0, 0, 0)
	)
alpha.save
beta = PledgeClass.create(
	name: "beta",
	pledge_semester: DateTime.new(2012, 1, 1, 0, 0, 0)
	)
beta.save
gamma = PledgeClass.create(
	name: "gamma",
	pledge_semester: DateTime.new(2012, 9, 1, 0, 0, 0)
	)
gamma.save
delta = PledgeClass.create(
	name: "delta",
	pledge_semester: DateTime.new(2013, 1, 1, 0, 0, 0)
	)
delta.save
epsilon = PledgeClass.create(
	name: "epsilon",
	pledge_semester: DateTime.new(2013, 9, 1, 0, 0, 0)
	)
epsilon.save
zeta = PledgeClass.create(
	name: "zeta",
	pledge_semester: DateTime.new(2014, 1, 1, 0, 0, 0)
	)
zeta.save
eta = PledgeClass.create(
	name: "eta",
	is_best_pledge_class: true,
	pledge_semester: DateTime.new(2014, 9, 1, 0, 0, 0)
	)
eta.save

bmobilized = Company.create(
	name: "bMobilized",
	description: "Makes your sites mobile.",
	logo_url: "companies/bmobilized.jpg",
	isVenture: false)

user = Brother.create(
	name: "Aryan Falahatpisheh",
	role: "Tech Chair",
	pledge_class: eta,
	grad_year: DateTime.new(2017, 5, 15, 20, 10, 0),
	description: "Aryan is a cool dude I guess",
	active: true,
	major: "Computer Science")

job = Job.create(
	role: "Mobile Engineer Intern",
	description: "Created a website builder in iOS.",
	brother: user,
	company: bmobilized
	)
user.jobs.push(job)
user.save

user = Brother.create(
	name: "Jasmine Stoy",
	role: "President",
	pledge_class: gamma,
	grad_year: DateTime.new(2016, 5, 15, 20, 10, 0),
	description: "I agree that Aryan is cool",
	image_url: "brothers/Jasmine-Stoy.jpg",
	active: true,
	major: "Business Administration")
user.save

user = Brother.create(
	name: "Anant Agarwal",
	role: "Pledgemaster",
	pledge_class: gamma,
	grad_year: DateTime.new(2016, 05, 15, 20, 10, 0),
	description: "Yeah no that guy's hot",
	image_url: "brothers/Anant-Agarwal.jpg",
	active: true,
	major: "Economics")
user.save


event = RushEvent.create(
	name: "Meet the Chapter",
	time: DateTime.new(2013, 9, 4, 6, 30, 0),
	location: "Bancroft Hotel",
	attire: "Business Casual"
	)
event.save
event = RushEvent.create(
	name: "Social Night",
	time: DateTime.new(2013, 9, 4, 6, 30, 0),
	location: "Bancroft Hotel",
	attire: "Business Casual"
	)
event.save
event = RushEvent.create(
	name: "Individual Interviews",
	time: DateTime.new(2013, 9, 4, 6, 30, 0),
	location: "Bancroft Hotel",
	attire: "Business Casual"
	)
event.save

event = RushEvent.create(
	name: "Individual Interviews",
	time: DateTime.new(2013, 9, 4, 6, 30, 0),
	location: "Bancroft Hotel",
	attire: "Business Casual"
	)
event.save




def getBrother(name)
	user = Brother.find_by(name: name)
	if user.nil?
		user = Brother.create(name: name)
		user.save
	end
	return user
end

def getPledgeClass(name)
	pclass = PledgeClass.find_by(name: name)
	if pclass.nil?
		pclass = PledgeClass.create(name: name)
	end
	return pclass
end

def getCompany(name)
	company = Company.find_by(name: name)
	if company.nil?
		company = Company.create(name: name)
		url = String.new(name)
		url.strip
		url = url.gsub(" ", "").downcase
		if (File.exists?("public/images/companies/" + url + ".jpg"))
			company.logo_url = "companies/" + url + ".jpg"
		elsif (File.exists?("public/images/companies/" + url + ".png"))
			company.logo_url = "companies/" + url + ".png"
		else
			
		end
		company.save
	end
	return company
end

def loadActives
	CSV.foreach("db/Raw/Actives.csv", :headers => true) do |row|
		vals = row.to_hash
		name = vals["Name"]

		pledgeClassName = vals["Class"]
		pledgeClassName.strip!
		pledgeClassName = pledgeClassName.downcase
		pledgeClass = getPledgeClass(pledgeClassName)


		gradYear = (vals["Year"]).to_i
		gradDate = DateTime.new gradYear

		brother = getBrother(name)
		brother.grad_year = gradDate
		brother.pledge_class = pledgeClass
		brother.active = true
		brother.major = vals["Major"]
		image_url = brother.to_image_name
		if (File.exists? ("public/images/brothers/" + image_url))
			brother.image_url = image_url
		end
		brother.save
	end

end

def loadVentures
	CSV.foreach("db/Raw/Ventures.csv", :headers => true) do |row|
		vals = row.to_hash
		name = vals["Company or Project Name"]

		company = getCompany(name)

		link = vals["website"]

		

		brotherNames = vals["Name(s)"].split("&")
		brothers = Array.new(brotherNames.size)
		brotherNames.each do |broName|
			puts broName
			puts name
			puts "HELLO +++++++++++++++++++++"
			broName = broName.strip
			brother = getBrother(broName)
			job = Job.create(role: :Creator, category: :Entrepreneurship, company: company, brother: brother)
			brother.jobs.push(job)
			brothers.push(brother)
		end

		company.isVenture = true
		company.description = vals["Description"]
		company.website = vals["Website"]
		company.notable = vals["Notable Achievements "]

		company.logo_url = vals["Logo"]
		if company.logo_url.nil?
			url = String.new(name)
			url.strip
			url = url.gsub(" ", "").downcase
			if (File.exists?("public/images/companies/" + url + ".jpg"))
				company.logo_url = "companies/" + url + ".jpg"
			elsif (File.exists?("public/images/companies/" + url + ".png"))
				company.logo_url = "companies/" + url + ".png"
			else
				company.logo_url = "companies/" + url + ".jpg"
			end
		end
		company.save
	end
end


def loadJobs

	CSV.foreach("db/Raw/Jobs.csv", :headers => true) do |row|
		vals = row.to_hash

		brotherName = vals["Name"]
		companyName = vals["Company"]
		role = vals["Position"]
		location = vals["Location"]
		category = vals["Category"]

		brother = getBrother(brotherName)
		company = getCompany(companyName)
		job =  Job.create(role: role, location: location, category: category, brother: brother, company: company)
		job.save
	end
end


loadActives
loadVentures
loadJobs