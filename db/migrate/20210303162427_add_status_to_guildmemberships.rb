class AddStatusToGuildmemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :guildmemberships, :status, :string, default: "pending"
  end
end
