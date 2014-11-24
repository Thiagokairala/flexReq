class CreateQuestionRelations < ActiveRecord::Migration
  def change
    create_table :question_relations do |t|
    	t.string :question_relation
      t.timestamps
    end
  end
end
