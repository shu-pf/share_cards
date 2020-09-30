class CreateMusicCards < ActiveRecord::Migration[6.0]
  def change
    create_table :music_cards do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :artist_name, null: false
      t.timestamps
    end
  end
end
