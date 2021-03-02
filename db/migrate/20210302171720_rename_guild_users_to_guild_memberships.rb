class RenameGuildUsersToGuildMemberships < ActiveRecord::Migration[6.0]
  def change
    rename_table :guild_users, :guildmemberships
  end
end
