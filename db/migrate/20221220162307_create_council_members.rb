class CreateCouncilMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :council_members do |t|
      t.integer :student_id, null: false
      t.string :rank, null: false
      t.integer :floor, default: nil

      t.timestamps
    end

    add_foreign_key :council_members, :students
    add_index :council_members, :student_id, unique: true
  end
end
