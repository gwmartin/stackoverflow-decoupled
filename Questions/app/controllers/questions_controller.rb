class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
    render json: @questions
  end

  def show
    @question = Question.where(id: params[:id]).first
    @answers = @question.answers
    render json: {question: @question, answers: @answers}
  end

  def create
    p params
    @question = Question.new(title: params[:title], content: params[:content])
      if @question.save
          render json: @question
      end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to root_path
  end

  def edit
    @question = Question.find(params[:id])
    render json: @question
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)

    if @question.save
      redirect_to question_path(@question)
    end

    render json: @questions
  end

  def upvote
    question = Question.where(id: params[:id]).first
    question.upvote
    # redirect_to root_path
    render json: question.vote_count
  end

  def downvote
    p "i am before find question"
    question = Question.where(id: params[:id]).first
    question.downvote
    # redirect_to root_path
    render json: question.vote_count
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end

