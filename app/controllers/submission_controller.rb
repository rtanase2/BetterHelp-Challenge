class SubmissionController < ApplicationController
    def new
        @submission = Submission.new
        @survey = Survey.find(params[:survey_id])
        @questions = Question.where(:survey_id => params[:survey_id])
        @answers = Answer.where(:survey_id => params[:survey_id])
        @submission.results = {}
    end

    def create
        @submission = Submission.new(submission_params)
        @submission.survey_id = params[:survey_id]
        @questions = Question.where(:survey_id => params[:survey_id])
        for q in @questions
            @field = params[:submission][:results][q.id.to_s]
            if  @field.kind_of?(Array)
                @field.count.times do |i|
                    print @field[i]
                end
            else
                print "!!!!!!!!!!!!!!!!!!!!!!!!!!!!" <<  @field << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!" 
            end
        end
        if @submission.save
            redirect_to '/survey/' << params[:survey_id]
        else
            render 'new'
        end
    end

    private
    def submission_params
        params.require(:submission).permit(:survey_id, :results)
    end

end
