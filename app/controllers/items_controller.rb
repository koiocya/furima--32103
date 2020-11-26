class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item =  Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in? && @item.user == current_user
      render :edit
    elsif @item.user != current_user
      redirect_to root_path
    else 
      redirect_to user_sessions_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to show
    else
      render :edit
    end
  end



  private

  def items_params
    params.require(:item).permit(:explain, :image, :name, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end
end
