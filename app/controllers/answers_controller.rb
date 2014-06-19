class AnswersController < ApplicationController
  def index
    # @answers = Question.all
  end

  def show
  end

  def new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id

    if @answer.save
      flash[:notice] = "Success!"
    else
      flash.now[:notice] = "Your answer couldn't be submitted."
    end
    redirect_to "/questions/#{@question.id}"
  end

  private

  def answer_params
    params.require(:answer).permit(:response)
  end


end
