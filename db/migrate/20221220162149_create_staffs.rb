class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.integer :user_id, null: false
      t.string :rank, null: false

      t.timestamps
    end

    add_foreign_key :staffs, :users
  end
end
