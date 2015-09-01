class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
        t.string :question
        t.string :input_type
        t.integer :position
        t.belongs_to :survey, index: true
        t.timestamps null:false
    end
  end
end
