class CreateGuildUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :guild_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :guild, null: false, foreign_key: true
      t.boolean :admin, default: false
      t.boolean :banned, default: false

      t.timestamps
    end
  end
end
