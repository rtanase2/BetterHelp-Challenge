class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
        t.string :option
        t.integer :position
        t.belongs_to :question, index: true
        t.belongs_to :survey, index:true
    end
  end
end
