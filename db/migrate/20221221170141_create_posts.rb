class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :council_member
      t.string :title, null: false
      t.string :text, null: false
      
      t.timestamps
    end
  end
end
