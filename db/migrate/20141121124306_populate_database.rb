class PopulateDatabase < ActiveRecord::Migration
  def change
  	traditional = Route.where(route: 'Traditional').first
  	agile = Route.where(route: 'Agile').first

  	team = QuestionRelation.where(question_relation: 'Team').first
  	process = QuestionRelation.where(question_relation: 'Process').first
  	project = QuestionRelation.where(question_relation: 'Project').first

  	# Each block initialize on the db the question and the practices
  	# related to that question as shown below
  	#------------------------------------------
  	question = Question.create(
  		question_text: 'Will your development team change on the development process?',
  		route: traditional,
  		question_relation: team
  	)

  	Practice.create(
  		practice_name: 'nome da pratica tradicional',
  		practice_description: 'descrição da pratica',
  		route: traditional,
  		question: question
  	)

  	Practice.create(
  		practice_name: 'nome da pratica agil',
  		practice_description: 'descrição da pratica',
  		route: agile,
  		question: question
  	)
  	#-------------------------------------------
  end
end
