class AnswerController < ApplicationController
    def index
        @answers = Answer.where(:question_id => params[:question_id])
    end

    def new
        @answer = Answer.new
    end

    def create
        @answer = Answer.new(answer_params)
        if @answer.save
            reditect_to ''
        else
            render 'new'
        end
    end

    def update
    end

    def destroy
    end

    def edit
    end

    private
    def answer_params
        params.require(:answer).permit(:option)
    end
end
