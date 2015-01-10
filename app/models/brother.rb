class Brother < ActiveRecord::Base
	has_many :jobs
	has_many :companies, :through => :jobs
	has_and_belongs_to_many :ventures
	belongs_to :pledge_class
	accepts_nested_attributes_for :jobs
	def image()
		if ((self.image_url).nil?)
	      return ('placeholder.png')
	    else
	      return (self.image_url)
	    end
	end

	def to_image_name
		ans = String.new(self.name)
		return (ans.gsub! " ", "-") + ".jpg"
	end
end
