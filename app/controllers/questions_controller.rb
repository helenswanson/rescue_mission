class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Success!"
      redirect_to questions_path
    else
      flash.now[:notice] = "Your question couldn't be submitted."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:notice] = "Success!"
      redirect_to questions_path(@question)
    else
      flash.now[:notice] = "Your edit couldn't be implimented."
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])

    @question.answers.each do |answer|
      answer.destroy
    end

    if @question.destroy
      flash[:notice] = "Question has been removed."
      redirect_to questions_path
    else
      render :show
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
