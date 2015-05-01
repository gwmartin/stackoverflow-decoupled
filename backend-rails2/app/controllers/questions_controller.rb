require 'dotenv'

class QuestionsController < ApplicationController
  Dotenv.load

  def index
    @questions = Question.all
    @question = Question.new
    response = HTTParty.get("https://api.github.com/zen", {client_id:  ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"]})
    if response.headers["status"] == "200 OK"
     @response = response.parsed_response
    else
      @response = "Do under to others as you would have them do unto you."
    end
  end

  def show
    @question = Question.where(id: params[:id]).first
    @answers = @question.answers
  end

  def create
    @question = Question.new(question_params)
      # redirect_to root_pathp
    # if request.xhr?
    # respond_to do |format|
      if @question.save
        p @question
          # format.html #{redirect_to root_path, notice: "you are having a bad life or day"}
          # format.json {render json: @question}
          render :json => @question
      end
    # end

  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)

   if @question.save
      redirect_to question_path(@question)
    end
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
# comment
