class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :cpf
      t.date :birth_date
      t.integer :cell
      t.string :gender
      t.string :type_payment

      t.timestamps
    end
  end
end
