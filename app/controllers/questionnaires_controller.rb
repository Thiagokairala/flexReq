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
		@questionnaire.route = get_questionnaire_route(@questionnaire)
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

	def get_questionnaire_route(questionnaire)
		routes = get_pratice_route(questionnaire.practices)
		routes_percentage = make_percentage(routes)
		route_to_return = ''
		if routes_percentage[:traditional] > 90.0
			route_to_return = 'Traditional'
		elsif routes_percentage[:agile] > 90.0
			route_to_return = 'Agile'
		else
			route_to_return = 'Hibryd'
		end
		Route.where(route: route_to_return).first()
	end

	def get_pratice_route(practices)
		howManyTrad = 0
		howManyAgile = 0
		routeTrad = Route.where(route: 'Traditional')
		routeAgile = Route.where(route: 'Agile')
		practices.each do |practice|
			if practice.route == routeTrad
				howManyTrad+=1
			else
				howManyAgile+=1
			end
		end
		{:traditional => howManyTrad, :agile =>howManyAgile}
	end

	def make_percentage(routes)
		total = routes[:traditional]+routes[:agile]
		percentage_traditional = (routes[:traditional]/total)*100
		percentage_agile = (routes[:agile]/total)*100

		{
			:traditional => percentage_traditional,
			:agile =>percentage_agile
		}
	end
end