class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.string :rank, null: false

      t.timestamps
    end
  end
end
