class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_judge

  def new
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :new
    end
  end
    
  private
  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_judge
    item = Item.find(params[:item_id])
    if current_user == item.user || Order.exists?(item_id: item.id)
      redirect_to root_path
    end
  end
end
