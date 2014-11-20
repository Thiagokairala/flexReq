class CreateQuestionRelations < ActiveRecord::Migration
  def change
    create_table :question_relations do |t|
    	t.string :question_relation
      t.timestamps
    end

    QuestionRelation.create(question_relation: 'Team')
    QuestionRelation.create(question_relation: 'Process')
    QuestionRelation.create(question_relation: 'Projetct')
  end
end
