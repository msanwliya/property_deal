class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.text :location
      t.integer :price
      t.integer :member
      t.integer :security_deposit
      t.references :user, foreign_key: true
      t.references :property_type, foreign_key: true

      t.timestamps
    end
  end
end
