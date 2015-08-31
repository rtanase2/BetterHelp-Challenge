class SurveyController < ApplicationController
    def index
        @surveys = Survey.all
    end

    def new
        @survey = Survey.new
    end

    def create
        @survey = Survey.new(survey_params)
        if @survey.save
            redirect_to '/survey'
        else
            redner 'new'
        end
    end
    
    private
        def survey_params
            params.require(:survey).permit(:keywords_required)
        end
end
