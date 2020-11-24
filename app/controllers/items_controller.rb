class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  def index 
    
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end


  private

  def items_params
    params.require(:item).permit(:image, :name, :price, :user, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end

  
end
