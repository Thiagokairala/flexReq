class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
    	t.string :route
      t.timestamps
    end

    Route.create(route: 'Traditional')
    Route.create(route: 'Agile')
  end
end
