class RemoveColumnsFromProfilestable < ActiveRecord::Migration
  def change
  remove_column :profiles, :name, :email
  end
end
