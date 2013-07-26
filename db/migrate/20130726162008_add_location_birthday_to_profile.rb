class AddLocationBirthdayToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :location, :text
    add_column :profiles, :birthday, :date
  end
end
