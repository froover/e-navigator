class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :interview_date
      t.integer :approval, default: 0
      t.string :user_id
      t.references :user, foreign_key: true, type: :integer

      t.timestamps
    end
    add_index :interviews, [:user_id, :interview_date, :approval]
  end
end
