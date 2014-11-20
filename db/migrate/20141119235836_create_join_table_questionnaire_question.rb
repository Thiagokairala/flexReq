class CreateJoinTableQuestionnaireQuestion < ActiveRecord::Migration
  def change
    create_join_table :questionnaires, :questions do |t|
      # t.index [:questionnaire_id, :question_id]
      # t.index [:question_id, :questionnaire_id]
      t.boolean :answer
    end
  end
end
