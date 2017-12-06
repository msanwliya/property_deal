class CreateLandlords < ActiveRecord::Migration[5.1]
  def change
    create_table :landlords do |t|
      t.text :address
      t.string :name
      t.bigint :mobile_no
      t.timestamps
    end
  end
end
