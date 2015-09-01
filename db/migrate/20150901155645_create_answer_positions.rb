class CreateAnswerPositions < ActiveRecord::Migration
  def change
    create_table :answer_positions do |t|

      t.timestamps null: false
    end
  end
end
