class Job < ActiveRecord::Base
	has_one :company
	belongs_to :brother
end
