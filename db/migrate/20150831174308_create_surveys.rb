class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :questions do |t|
        t.belongs_to :surveys, index: true
    end
  end
end
