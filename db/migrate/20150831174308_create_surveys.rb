class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.timestamps null: false
    end
    create_table :questions do |t|
        t.string :question
        t.string :input_type
        t.belongs_to :survey, index: true
        t.timestamps null:false
    end
  end
end
