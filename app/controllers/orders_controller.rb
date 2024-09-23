class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create, :edit]
  before_action :redirect_if_not_valid, only: [:index, :create]
  before_action :set_payjp_public_key, only: [:index, :create]


  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_form = OrderForm.new
  end

  def create
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index'
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
   @item = Item.find_by(id: params[:item_id])
  end

  def set_payjp_public_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end


  def redirect_if_not_valid
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :address, :house_number, :phone_number, :token).merge(token: params[:token], user_id: current_user.id, item_id: @item.id, price: @item.price)
  end
end
