class CreateJoinTableQuestionnairePractice < ActiveRecord::Migration
  def change
    create_join_table :questionnaires, :practices do |t|
      # t.index [:questionnaire_id, :practice_id]
      # t.index [:practice_id, :questionnaire_id]
    end
  end
end
