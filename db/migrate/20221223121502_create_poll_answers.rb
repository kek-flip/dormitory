class CreatePollAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :poll_answers do |t|

      t.timestamps
    end
  end
end
