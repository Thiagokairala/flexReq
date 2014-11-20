class AddQuestionRefToPractices < ActiveRecord::Migration
  def change
  	add_reference :practices, :question, index: true
  	add_reference :practices, :route, index: true
  end
end
