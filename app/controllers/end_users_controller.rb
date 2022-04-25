class EndUsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
     @end_user = EndUser.find(params[:id])
  end

  def update
     @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user)
    else
      render "edit"
    end
  end

  private
  def end_user_params
    params.require(:end_user).permit(:name, :introduction)
  end

  def ensure_guest_user
    @end_user = EndUser.find(params[:id])
    if @end_user.name == "guestuser"
      redirect_to end_user_path(current_end_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
