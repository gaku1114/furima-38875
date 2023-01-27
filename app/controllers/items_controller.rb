class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :price, :postage_id, :deadline_id,
                                 :prefecture_id).merge(user_id: current_user.id)
  end
end
