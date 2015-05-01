class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])

    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      redirect_to question_path(@question)
      #same as redirect to @question
    end
  end

  def upvote
    answer = Answer.where(id: params[:id]).first
    answer.upvote
    render json: answer.vote_count
  end

  def downvote
    answer = Answer.where(id: params[:id]).first
    answer.downvote
    # make sure to grab data needed from current to bring to
    # redirect path (question_path)
    # redirect_to question_path(params[:question_id])
    render json: answer.vote_count
  end


  private

  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end



