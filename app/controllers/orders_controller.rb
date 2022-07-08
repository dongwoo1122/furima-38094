class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orderform = OrderForm.new
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @orderform = OrderForm.new(orderform_params)
    @item = Item.find(params[:item_id])
    if @orderform.valid?
      pay_item
      @orderform.save
      return redirect_to root_path
    else
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
