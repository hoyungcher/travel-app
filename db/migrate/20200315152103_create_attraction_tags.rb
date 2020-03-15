class CreateAttractionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :attraction_tags do |t|
      t.references :attraction, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
