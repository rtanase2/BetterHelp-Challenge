class AddResultsToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :results, :text
  end
end
