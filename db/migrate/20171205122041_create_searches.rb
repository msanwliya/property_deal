class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.text :location
      t.references :max_price, foreign_key: true
      t.references :min_price, foreign_key: true
      t.references :property_type, foreign_key: true

      t.timestamps
    end
  end
end
