class QuestionController < ApplicationController
    def index
        @questions = Question.where(:survey_id => params[:survey_id])
    end

    def edit
        @question = Question.find(params[:id])
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(question_params)
        @question.survey_id = params[:survey_id]
        if @question.save
            redirect_to '/survey/' << params[:survey_id] <<'/question'
        else
            render 'new'
        end
    end

    def update
        @question = Question.find(params[:id])
        if @question.update_attributes(question_params)
            redirect_to '/survey/' << params[:survey_id] << '/question'
        else
            render 'edit'
        end
    end

    def destroy
        @question = Question.find(params[:id])
        @question.destroy
        redirect_to "/survey/" << params[:survey_id] << "/question"
    end

    private
    def question_params
        params.require(:question).permit(:question, :input_type, :survey_id)
    end
end
