class AddQuestionRelationRefToQuestion < ActiveRecord::Migration
  def change
  	add_reference :questions, :question_relation, index: true
  end
end
