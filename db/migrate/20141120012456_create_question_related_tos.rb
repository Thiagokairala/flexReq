class CreateQuestionRelatedTos < ActiveRecord::Migration
  def change
    create_table :question_related_tos do |t|
    	t.string :question_related_to
      t.timestamps
    end
  end
end
