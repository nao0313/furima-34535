class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      rendirecto_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, token: params[:token])
  end

    def pay_item
      pay.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        card: order_params[:token],
        currency: 'jpy'
      )
    end
end
