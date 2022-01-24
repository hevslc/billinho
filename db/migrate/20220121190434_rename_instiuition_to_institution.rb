class RenameInstiuitionToInstitution < ActiveRecord::Migration[7.0]
  def change
    rename_column :enrollments, :instituition_id, :institution_id
  end
end
