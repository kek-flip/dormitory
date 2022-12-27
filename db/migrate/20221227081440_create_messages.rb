class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.belongs_to :council_member, foreign_key: true
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
