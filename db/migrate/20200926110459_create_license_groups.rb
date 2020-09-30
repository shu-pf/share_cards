class CreateLicenseGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :license_groups do |t|
      t.integer :card_id
      t.integer :music_card_id
      t.integer :number_of_licenses, null: false
      t.timestamps
    end
  end
end
