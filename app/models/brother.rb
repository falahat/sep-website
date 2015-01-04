class Brother < ActiveRecord::Base
	has_many :jobs

	def image()
		if ((self.image_url).nil?)
	      return ('placeholder.png')
	    else
	      return (self.image_url)
	    end
	end
end
