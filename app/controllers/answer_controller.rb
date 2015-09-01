class AnswerController < ApplicationController
    def index
        @answers = Answer.where(:question_id => params[:question_id])
    end

    def new
        @answer = Answer.new
    end

    def create
        @answer = Answer.new(answer_params)
        @answer.postion = Answer.where(:question_id => params[:question_id]).count + 1
        if @answer.save
            reditect_to ''
        else
            render 'new'
        end
    end

    def update
        @answer = Answer.find(params[:id])
        if @answer.update_attributes(answer_params)
            redirect_to '/survey/' << params[:survey_id] << '/question/' << params[:question_id] << '/answer'
        else
            render 'edit'
        end
    end

    def destroy
    end

    def edit
        @answer = Answer.find(params[:id])
    end

    private
    def answer_params
        params.require(:answer).permit(:option)
    end
end
