class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.belongs_to :user
      t.string :rank, null: false

      t.timestamps
    end
  end
end
