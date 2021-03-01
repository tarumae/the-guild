class CreateGuilds < ActiveRecord::Migration[6.0]
  def change
    create_table :guilds do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
