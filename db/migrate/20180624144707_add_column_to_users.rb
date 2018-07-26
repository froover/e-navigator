class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :date, null: false
    add_column :users, :gender, :integer, limit: 1, default:nil
    add_column :users, :school, :string
  end
end
