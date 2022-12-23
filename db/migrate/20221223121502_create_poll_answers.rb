class CreatePollAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :poll_answers do |t|
      t.belongs_to :student
      t.belongs_to :poll
      t.string :answers

      t.timestamps
    end
  end
end
