class Restaurant < ActiveRecord::Base
	validates :name, presence: true
	validates :rating, length: { maximum: 5 }
	validates :friends, length: { maximum: 5 }
end
