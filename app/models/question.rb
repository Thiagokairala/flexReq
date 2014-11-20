class Question < ActiveRecord::Base
	#question_text :String
	belongs_to :route
	has_many :practices
	has_and_belongs_to_many :questionnaires
end
