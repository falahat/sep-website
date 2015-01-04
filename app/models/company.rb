class Company < ActiveRecord::Base
	belongs_to_many :jobs
	belongs_to_many :brothers
end
