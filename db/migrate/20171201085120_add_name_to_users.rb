class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile_no, :bigint
    add_column :users, :role, :integer
    # add_column :users, :rolable_id, :integer
    # add_column :users, :rolable_type, :string
  end
end
