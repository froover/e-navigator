class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :interview_date
      t.integer :approval
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :interviews, [:user_id, :interview_date, :approval]
  end
end
