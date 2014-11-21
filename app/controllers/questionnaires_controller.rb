class QuestionnairesController < ApplicationController
	def index
		questions = Question.all().order(:question_relations_id)
		@questionnaire = Questionnaire.new(questions: questions)
	end

	def create
		questions = Question.all().order(:question_relations_id)
		i = 0
		questionnaire = Questionnaire.new()
		answers = params[:answer]
		@answers_array = []
		answers.each do |answer_value|
			answer = make_answer(questions[i], questionnaire, answer_value)
			answer.save
			@answers_array.push answer
		end
		questionnaire.save
	end

	private
	
	def make_answer(question, questionnaire, answer)
		answer = Answer.new
		answer.answer = answer
		answer.question = question
		answer.questionnaire = questionnaire
		answer
	end
end