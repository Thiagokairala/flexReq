class Practice < ActiveRecord::Base
	belongs_to :route
	belongs_to :question
end
