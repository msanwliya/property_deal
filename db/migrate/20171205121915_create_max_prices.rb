class CreateMaxPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :max_prices do |t|
      t.decimal :max

      t.timestamps
    end
  end
end
