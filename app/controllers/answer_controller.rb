class AnswerController < ApplicationController
    def edit_pos
        @answers = Answer.where(:question_id => params[:question_id])
    end

    def update_pos
        @answers = Answer.where(:question_id => params[:question_id])
        positions = params[:answers][:positions]
        print positions
        # If each answer has a unique position (2 pieces cannot have postion 1)
        if Set[*positions.values].count == @answers.count
            for answer in @answers 
                answer.update_attribute(:position, positions[answer.id.to_s].to_i)
            end
            redirect_to '/survey/' << params[:survey_id] << '/question/' << params[:question_id] << "/answer"
        else
            flash[:notice] = "Some answers had the same position. Make sure there is only one answer per position."
            redirect_to '/survey/' << params[:survey_id] << "/question/" << params[:question_id] << '/answer/edit-pos'
        end
    end

    def index
        @answers = Answer.where(:question_id => params[:question_id])
    end

    def new
        @answer = Answer.new
    end

    def create
        @answer = Answer.new(answer_params)
        @answer.position = Answer.where(:question_id => params[:question_id]).count + 1
        @answer.survey_id = params[:survey_id]
        @answer.question_id = params[:question_id]
        if params[:answer][:option] == ""
            flash[:notice] = "Must fill in option field"
            redirect_to '/survey/' << params[:survey_id] << "/question/" << params[:question_id] << "/answer/new"
        else
            if @answer.save
                redirect_to '/survey/' << params[:survey_id] << "/question/" << params[:question_id] << "/answer"
            else
                render 'new'
            end
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
        @answer = Answer.find(params[:id])
        for a in Answer.where(:question_id => params[:question_id])
            if a.position > @answer.position
                a.update_attribute(:position, a.position.to_i-1)
            end
        end
        @answer.destroy
        redirect_to "/survey/" << params[:survey_id] << "/question/" << params[:question_id] << "/answer"
    end

    def edit
        @answer = Answer.find(params[:id])
    end

    private
    def answer_params
        params.require(:answer).permit(:option)
    end
end
