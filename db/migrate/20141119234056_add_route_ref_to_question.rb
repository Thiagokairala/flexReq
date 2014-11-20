class AddRouteRefToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :route, index: true
  end
end
