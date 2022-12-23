class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.belongs_to :student
      t.belongs_to :staff
      t.integer :floor, null: false
      t.string :location, null: false
      t.string :problem, null: false
      t.string :status, null: false, default: 'Не рассмотрено'

      t.timestamps
    end
  end
end
