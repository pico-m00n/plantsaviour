class ReactionsController < ApplicationController

  def new
   answer = Answer.find(params[:answer_id])
   @reaction = answer.reactions.build(end_user_id: current_end_user.id)
  end

  def create
      answer = Answer.find(params[:answer_id])
      @reaction = answer.reactions.build(reaction_params)

      respond_to do |format|
        if @reaction.save
          format.html { redirect_to answer.question, notice: 'Reaction was successfully created.' }
          format.json { render :show, status: :created, location: @reaction }
        else
          format.html { render :new }
          format.json { render json: @reaction.errors, status: :unprocessable_entity }
        end
      end
    end

    private
    def reaction_params
    params.require(:reaction).permit(:end_user_id, :answer_id, :body)
  end

end
