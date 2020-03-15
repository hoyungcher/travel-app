class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.references :country, foreign_key: true
      t.references :region, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
