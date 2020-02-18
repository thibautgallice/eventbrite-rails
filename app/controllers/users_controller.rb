class UsersController < ApplicationController
  before_action :is_current_user?, only: [:show]
  before_action :authenticate_user!

  def show
    set_current_user
    if current_user == @user
      @user = User.find_by(id:params[:id])
    else 
      redirect_to root_path
    end
  end



  private 

  def set_current_user
    @user = User.find(params[:id])
  end
  
  def set_current_id
    @id = params['id']
  end

  def is_current_user?
    unless current_user
      redirect_to root_path
    end
  end
  
end
