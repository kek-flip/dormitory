class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.integer :user_id, null: false
      t.integer :room, null: false

      t.timestamps
    end

    add_foreign_key :students, :users
  end
end
