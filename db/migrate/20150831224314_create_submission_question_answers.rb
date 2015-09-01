class CreateSubmissionQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :submission_question_answers do |t|
      t.references :question
      t.references :answer
      t.references :submission
      t.timestamps null: false
    end
  end
end
