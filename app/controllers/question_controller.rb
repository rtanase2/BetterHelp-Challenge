class QuestionController < ApplicationController
    def index
        @questions = Question.where(:survey_id => params[:survey_id])
    end

    def edit
        @question = Question.find(params[:id])
    end

    def update
        @question = Question.find(params[:id])
        if @question.update_attributes(question_params)
            redirect_to '/survey/' << params[:survey_id] << '/question'
        else
            render 'edit'
        end
    end

    private
    def question_params
        params.require(:question).permit(:question)
    end
end
