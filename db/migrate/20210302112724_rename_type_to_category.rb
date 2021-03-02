class RenameTypeToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :guilds, :type, :category
  end
end
