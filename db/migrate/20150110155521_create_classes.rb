class CreateClasses < ActiveRecord::Migration
  def change
    create_table :classes do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.datetime :date, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.integer :user_id, null: false
    end
  end
end
