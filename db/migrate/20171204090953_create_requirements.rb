class CreateRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :requirements do |t|
      t.text :location
      t.integer :max
      t.integer :min
      t.references :property_type, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
