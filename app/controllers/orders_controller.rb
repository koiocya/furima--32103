class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_form = ItemOrder.new
    
  end

  def create
    @item = Item.find(params[:item_id])
    @item_form = ItemOrder.new(order_params)
    if @item_form.valid? 
      @item_form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:item_order).permit(:card_number, :card_exp_month, :card_exp_year, :ard_cvc, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
# 

