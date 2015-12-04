class AddShortDescriptionToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :short_description, :text
  end
end
