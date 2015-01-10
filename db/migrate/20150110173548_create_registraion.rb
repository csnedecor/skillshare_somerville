class CreateRegistraion < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :user_id, null: false
      t.integer :workshop_id, null: false

      t.timestamps
    end
  end
end
