class AddApprovedToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :approve, :boolean, :default => false, :null => false
  end
end
