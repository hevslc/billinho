class AddEnrollmentIdToInvoice < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :enrollment_id, :integer
    add_index :invoices, :enrollment_id
  end
end
