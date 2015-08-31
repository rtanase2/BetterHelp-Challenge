class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
        t.string :option
        t.string :value
        t.belongs_to :question, index: true
    end
  end
end
