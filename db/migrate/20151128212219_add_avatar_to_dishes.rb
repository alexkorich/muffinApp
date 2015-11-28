class AddAvatarToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :avatar, :string
  end
end
