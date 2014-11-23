class Practice < ActiveRecord::Base
	belongs_to :route
	belongs_to :question
	has_one :equivalent, :class_name => 'Practice', :foreign_key => 'equivalent_id'
end
