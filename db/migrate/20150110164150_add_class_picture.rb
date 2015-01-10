class AddClassPicture < ActiveRecord::Migration
  def change
    add_column :workshops, :workshop_pic, :string
  end
end
