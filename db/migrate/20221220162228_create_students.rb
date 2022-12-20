class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.belongs_to :user
      t.integer :room, null: false

      t.timestamps
    end
  end
end
