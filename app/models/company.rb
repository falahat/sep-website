class Company < ActiveRecord::Base
	belongs_to :jobs
	belongs_to :brothers
end
