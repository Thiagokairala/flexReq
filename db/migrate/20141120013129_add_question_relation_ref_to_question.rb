class AddQuestionRelationRefToQuestion < ActiveRecord::Migration
  def change
  	add_reference :questions, :question_relations, index: true
  end
end
