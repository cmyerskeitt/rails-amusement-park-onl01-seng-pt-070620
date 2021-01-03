class UsersController < ApplicationController
  skip_before_action :verify_user, only: [:new, :create]

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user_id
        redirect_to user_path(@user)
      else
        redirect_to new_user_path 
      end

  end


  private

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin, :mood)
    end
end
