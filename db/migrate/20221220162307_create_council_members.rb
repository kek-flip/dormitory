class CreateCouncilMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :council_members do |t|
      t.belongs_to :student
      t.string :rank, null: false
      t.integer :floor, default: nil

      t.timestamps
    end
  end
end
