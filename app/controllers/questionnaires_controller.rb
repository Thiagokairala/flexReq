class QuestionnairesController < ApplicationController
	PERCENTAGE_FOR_CONSIDERATION_OF_ROUTE = 90.0

	def index
		@questionnaires = Questionnaire.all()
	end

	def new
		questions = Question.all().order(:id)
		@questionnaire = Questionnaire.new(questions: questions)
	end

	def create
		# Retrieving all the questions, ordered by their relation
		# by team process and project
		questions = Question.all().order(:id)
		i = 0
		# creating a new global variable to use on the html
		@questionnaire = Questionnaire.new()
		# Retrieving users answers
		answers = params[:answer]
		# Getting the practices the user is going to use
		practices = []
		puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
		answers.each do |answer_value|
			puts questions[i].question_text
			answer = make_answer(questions[i], @questionnaire, answer_value)
			answer.save()
			practices.push(get_practices(answer))
			i+=1
		end

		# Processing and saving questionnaire before sending to html
		@questionnaire.practices << practices
		@questionnaire.route = get_questionnaire_route(@questionnaire)
		@questionnaire.save
	end

	def show
		@questionnaire = Questionnaire.where(id: params[:id]).first
	end

	def edit
		@questionnaire = Questionnaire.where(id: params[:id]).first
	end

	private

	# This method process to see if the answer is true or false
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

	# Get the practices of the question that are better fitted for the users project
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

	# This method gets the route fo the questionnaire based on the practices routes
	def get_questionnaire_route(questionnaire)
		routes = get_pratice_route(questionnaire.practices)
		
		routes_percentage = make_percentage(routes)
		route_to_return = ''
		if routes_percentage[:traditional] > PERCENTAGE_FOR_CONSIDERATION_OF_ROUTE
			route_to_return = 'Traditional'
		elsif routes_percentage[:agile] > PERCENTAGE_FOR_CONSIDERATION_OF_ROUTE
			route_to_return = 'Agile'
		else
			route_to_return = 'Hibryd'
		end
		Route.where(route: route_to_return).first()
	end

	# This method gets the number of practices of each route on the project
	def get_pratice_route(practices)
		howManyTrad = 0
		howManyAgile = 0
		practices.each do |practice|
			if practice.route.route == 'Traditional'
				howManyTrad+=1
			else
				howManyAgile+=1
			end
		end
		# Creating and returning a hash with the numbers
		{:traditional => howManyTrad, :agile =>howManyAgile}
	end

	# This method generates the porcentage of each route on the project
	def make_percentage(routes)
		total = routes[:traditional]+routes[:agile]
		percentage_traditional = (routes[:traditional]/total)*100
		percentage_agile = (routes[:agile]/total)*100

		# Creating and returning a hash with the percentages
		{:traditional => percentage_traditional,:agile =>percentage_agile}
	end
end