class Change < ActiveRecord::Migration[5.1]
  def self.up
    change_column_null :interviews, :user_id, false, 0
  end

  def self.down
    change_column_null :interviews, :user_id, true, nil
  end
end
