class AddRouteRefToQuestionnaire < ActiveRecord::Migration
  def change
    add_reference :questionnaires, :route, index: true
  end
end
