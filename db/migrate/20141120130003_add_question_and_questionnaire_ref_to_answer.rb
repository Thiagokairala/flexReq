class AddQuestionAndQuestionnaireRefToAnswer < ActiveRecord::Migration
  def change
  	add_reference :answers, :question, index: true
  	add_reference :answers, :questionnaire, index: true
  end
end
