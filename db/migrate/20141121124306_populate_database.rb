class PopulateDatabase < ActiveRecord::Migration
  def change
  	Question.create()
  end
end
