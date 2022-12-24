class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :staff, foreign_key: true
      t.integer :floor, null: false
      t.string :location, null: false
      t.string :problem, null: false
      t.string :status, null: false, default: 'Не рассмотрено'

      t.timestamps
    end
  end
end
