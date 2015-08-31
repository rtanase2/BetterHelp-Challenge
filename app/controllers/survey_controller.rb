class SurveyController < ApplicationController
    def index
        @surveys = Survey.all
    end

    def edit
        @survey = Survey.find(params[:id])
    end

    def show
        if params[:id] == nil
            params[:id] = 1
        end
        @survey = Survey.find(params[:id])
        @questions = Question.where(:survey_id => params[:id])
    end

    def update
    end
    
    private
        def survey_params
            params.require(:survey).permit(:name, :questions)
        end
end
