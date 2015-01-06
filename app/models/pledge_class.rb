class PledgeClass < ActiveRecord::Base
	has_many :brothers
	has_one :professional_event
	serialize :images, Array
end
