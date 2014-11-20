class PopulateQuestionsTest < ActiveRecord::Migration
  def change
  	Question.create(question_text: 'Teste', route: Route.where(route: 'Traditional').first)
  	Question.create(question_text: 'Teste', route: Route.where(route: 'Traditional').first)
  	Question.create(question_text: 'Teste', route: Route.where(route: 'Traditional').first)
  	Question.create(question_text: 'Teste', route: Route.where(route: 'Traditional').first)
  	Question.create(question_text: 'Teste', route: Route.where(route: 'Traditional').first)
  	Question.create(question_text: 'Teste', route: Route.where(route: 'Traditional').first)
  	Question.create(question_text: 'Teste', route: Route.where(route: 'Traditional').first)
  	Question.create(question_text: 'Teste', route: Route.where(route: 'Traditional').first)
  	Question.create(question_text: 'Teste', route: Route.where(route: 'Traditional').first)
  	Question.create(question_text: 'Teste', route: Route.where(route: 'Traditional').first)
  	Question.create(question_text: 'Teste', route: Route.where(route: 'Traditional').first)
  end
end
