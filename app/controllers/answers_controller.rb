class AnswersController < ApplicationController
  before_action :authenticate_end_user!

  def new
    question = Question.find(params[:question_id])
    @answer = question.answers.build(end_user_id: current_end_user.id)
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.end_user_id = current_end_user.id
    @answer.question_id = params[:question_id]
    if @answer.save
      flash[:notice] = "成功！"
      redirect_to("/questions/#{params[:question_id]}")
    else
      @question = Question.find(params[:question_id])
      flash.now[:alert] = "失敗！"
      render "questions/show"
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end


end
