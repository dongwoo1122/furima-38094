class ItemsController < ApplicationController

  def index #indexアクション
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    param.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :price, :delivery_fee_id, :address_region_id, :send_time_id).merge(user_id: current_user.id)
  end

end