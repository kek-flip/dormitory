class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login, null: false, index: { unique: true }
      t.string :password_digest, null: false

      t.string :name, null: false
      t.string :surname, null: false
      t.string :second_name

      t.timestamps
    end
  end
end
