class SubmissionController < ApplicationController
    def new
        @submission = Submission.new
        @survey = Survey.find(params[:survey_id])
        @questions = Question.where(:survey_id => params[:survey_id])
        @answers = Answer.where(:survey_id => params[:survey_id])
        print @questions
    end

    def create
        @submission = Submission.new(submission_params)
        if @submission.save
            redirect_to ''
        else
            render 'new'
        end
    end

    private
    def submission_params
        params.require(:submission).permit(:survey_id)
    end

end
