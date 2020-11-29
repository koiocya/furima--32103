class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_form = ItemOrder.new
    
  end

  def create
    @item = Item.find(params[:item_id])
    @item_form = ItemOrder.new(order_params)
    if @item_form.valid? 
      pay_item
      @item_form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:item_order).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,:order_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_aa17aa844c67e0e305b2e11a"
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'
    )
    end

end

