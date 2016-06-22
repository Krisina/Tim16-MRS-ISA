class Foodndrink < ActiveRecord::Base
belongs_to :user
belongs_to :fooddrink, :class_name => "User"
end
