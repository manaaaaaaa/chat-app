class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
<<<<<<< Updated upstream:db/migrate/20200802091740_create_rooms.rb
=======

>>>>>>> Stashed changes:db/migrate/20200802120836_create_rooms.rb
      t.timestamps
    end
  end
end
