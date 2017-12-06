class CreateMinPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :min_prices do |t|
      t.decimal :min

      t.timestamps
    end
  end
end
