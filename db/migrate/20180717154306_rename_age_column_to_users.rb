class RenameAgeColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :age, :birthday
  end
end
