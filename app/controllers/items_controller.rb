class ItemsController < ApplicationController

  def index 
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(items_params)
    if @user.save
      redirect_to action: :index
    else
      render action: :new
    end
  end


  private

  def items_params
    params.require(:user).permit(:nickname, :first_name, :first_name_reading, :last_name, :last_name_reading, :birthday)
  end
  
end
