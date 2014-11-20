class Questionnaire < ActiveRecord::Base
	has_many :questionnaires_questions
	has_and_belongs_to_many :questions
end