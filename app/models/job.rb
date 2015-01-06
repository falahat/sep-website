class Job < ActiveRecord::Base
	belongs_to :company
	belongs_to :brother
end
