class QuestionnairesController < ApplicationController
	def index
		questions = Question.all().order(:question_relation_id)
		@questionnaire = Questionnaire.new(questions: questions)
	end

	def create
		questions = Question.all().order(:question_relation_id)
		i = 0
		@questionnaire = Questionnaire.new()
		answers = params[:answer]
		@answers_array = []
		practices = []
		answers.each do |answer_value|
			answer = make_answer(questions[i], @questionnaire, answer_value)
			answer.save()
			@answers_array.push(answer)
			practices.push(get_practices(answer))

		end
		@questionnaire.practices << practices
		@questionnaire.save
	end

	private
	
	def make_answer(question, questionnaire, answer_value)
		answer = Answer.new
		# GAMBIARRA
		if answer_value[1] == "true"
			answer.answer = true;
		else
			answer.answer = false;
		end
		answer.question = question
		answer.questionnaire = questionnaire
		return answer
	end

	def get_practices(answer)
		question = answer.question
		routeQuestion = question.route
		practices = question.practices
		practices_to_return = []

		if answer.answer == true
			practices_to_return = practices.where(route: routeQuestion)
		else 
			practices_to_return = practices.where.not(route: routeQuestion)
		end

		return practices_to_return
	end
end