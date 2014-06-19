class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])

  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Success!"
      redirect_to '/questions'
    else
      flash.now[:notice] = "Your question couldn't be submitted."
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end






end
