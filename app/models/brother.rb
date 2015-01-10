class Brother < ActiveRecord::Base
	has_many :jobs
	has_many :companies, :through => :jobs
	has_and_belongs_to_many :ventures
	belongs_to :pledge_class
	accepts_nested_attributes_for :jobs
	def image()
		base = "brothers/"
		if ((self.image_url).nil?)
	      return base + ('placeholder.png')
	    else
	      return base + (self.image_url)
	    end
	end

	def to_image_name
		ans = String.new(self.name)
		ans = ans.downcase
		return (ans.gsub! " ", "-") + ".jpg"
	end
end
