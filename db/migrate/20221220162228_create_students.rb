class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.integer :room, null: false

      t.timestamps
    end
  end
end
