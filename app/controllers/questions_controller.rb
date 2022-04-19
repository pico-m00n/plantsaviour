class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
   # @questions = Question.all
   #タグ絞り込み機能
    @questions = params[:tag_id].present? ? Tag.find(params[:tag_id]).questions : Question.all
  end

  def show
    @answer = Answer.new
  end

  def new
    @tags = Tag.all
    @question = Question.new
  end

  def edit
    @tags = Tag.all
  end

  # create のみ修正
  def create
    @question = current_end_user.questions.build(question_params)
    respond_to do |format|
      if @question.save
        format.html {redirect_to @question, notice: 'Question was successfully created.'}
        format.json {render :show, status: :created, location: @question}
      else
        format.html {render :new}
        format.json {render json: @question.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html {redirect_to @question, notice: 'Question was successfully updated.'}
        format.json {render :show, status: :ok, location: @question}
      else
        format.html {render :edit}
        format.json {render json: @question.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html {redirect_to questions_url, notice: 'Question was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

 #Tag??
  def question_params
    params.require(:question).permit(:end_user_id, :title, :body, :best_answer_id, {:tag_ids => []})
  end

end
