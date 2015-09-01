class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.belongs_to :survey
      t.timestamps null: false
    end
  end
end
