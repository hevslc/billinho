class RenameTypeToIesType < ActiveRecord::Migration[7.0]
  def change
    rename_column :institutions, :type, :ies_type
  end
end
