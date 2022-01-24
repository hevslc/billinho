class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.decimal :total_value
      t.integer :n_invoice
      t.integer :due_day
      t.string :course

      t.timestamps
    end
  end
end
