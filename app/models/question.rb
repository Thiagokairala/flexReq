class Question < ActiveRecord::Base
	#question_text :String
	belongs_to :route
	belongs_to :question_relation
	has_many :practices
	has_and_belongs_to_many :questionnaires
end
