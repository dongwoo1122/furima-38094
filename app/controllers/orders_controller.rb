class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @orderform = OrderForm.new
    if @item.user_id == current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @orderform = OrderForm.new(orderform_params)
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

  def set_item
    @item = Item.find(params[:item_id])
  end

end
