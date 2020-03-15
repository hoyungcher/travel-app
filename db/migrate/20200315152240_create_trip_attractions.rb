class CreateTripAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_attractions do |t|
      t.references :trip, foreign_key: true
      t.references :attraction, foreign_key: true

      t.timestamps
    end
  end
end
