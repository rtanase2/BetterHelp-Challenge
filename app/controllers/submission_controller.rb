class SubmissionController < ApplicationController
   def index
        @survey = Survey.find(params[:survey_id])
   end

    def new
        @submission = Submission.new
        @survey = Survey.find(params[:survey_id])
        @questions = Question.where(:survey_id => params[:survey_id])
        @answers = Answer.where(:survey_id => params[:survey_id])
    end

    def create
        @submission = Submission.new(submission_params)
        @submission.survey_id = params[:survey_id]
        @questions = Question.where(:survey_id => params[:survey_id])
        @submission.results = {}
        for q in @questions
            @field = params[:submission][:results][q.id.to_s]
            @submission.results[q.id.to_s] = @field
        end
        if @submission.save
            redirect_to '/survey/' << params[:survey_id] << "/submission"
        else
            render 'new'
        end
    end

    private
    def submission_params
        params.require(:submission).permit(:survey_id, :results)
    end

end
