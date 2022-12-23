class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.belongs_to :council_member
      t.string :title, null: false
      t.string :questions, null: false

      t.timestamps
    end
  end
end
