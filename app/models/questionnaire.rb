class Questionnaire < ActiveRecord::Base
	has_many :answers
	has_many :questions, through: :answers
	has_and_belongs_to_many :practices
	belongs_to :route
end