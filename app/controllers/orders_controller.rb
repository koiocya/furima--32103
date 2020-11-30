class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  def index
      if @item.user == current_user || @item.user != current_user && @item.order.present?
        redirect_to root_path
      end
    @item_form = ItemOrder.new
  end

  def create
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'
    )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

end

