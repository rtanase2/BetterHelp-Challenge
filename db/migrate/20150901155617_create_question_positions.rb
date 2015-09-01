class CreateQuestionPositions < ActiveRecord::Migration
  def change
    create_table :question_positions do |t|

      t.timestamps null: false
    end
  end
end
