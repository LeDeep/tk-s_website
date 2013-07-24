class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.string :bio
      t.string :favorite_family_memory

      t.timestamps
    end
  end
end
