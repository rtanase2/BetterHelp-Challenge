class QuestionController < ApplicationController
    def index
        @questions = Question.where(:survey_id => params[:survey_id])
    end

    def edit
        @question = Question.find(params[:id])
    end
end
