class QuestionnairesController < ApplicationController
	def index
		@questionnaire = Questionnaire.create()
		@questionnaire.questions  = Question.all().order(:question_relations_id)
		@questionnaire.save()
	end

	def create
	end
end
