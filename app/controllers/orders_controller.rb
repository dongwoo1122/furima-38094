class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new(orderform_params)
    if @orderform.valid?
      pay_item
      @orderform.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def orderform_params
    params.require(:order_form).permit(:address_city, :address_region_id, :address_street, :address_building, :postcode, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: orderform_params[:token],
      currency: 'jpy'
    )
  end
end
