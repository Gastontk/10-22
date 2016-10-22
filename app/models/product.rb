class Product < ActiveRecord::Base
	validates :name, presence: true, length: {in:3..30}
	

end
