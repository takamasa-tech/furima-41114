class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_not_valid, only: [:index, :create, :edit]
  before_action :set_payjp_public_key, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    if @order_form.valid?
      @order_form.process_order
      redirect_to root_path
    else
      render :index
    end
  end


  def edit
    @order = Order.find(params[:id])
  end
    end

    @order = Order.find(params[:id])
    return unless @order.item.sold? || @order.item.user == current_user

    redirect_to root_path
  end


  private
def order_params
  params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :addresses, :house_number, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id], price: @item.price)
end

def set_item
  @item = Item.find_by(id: params[:item_id])
  unless @item
    flash[:error] = "Item not found"
    redirect_to root_path
  end
end


  def set_payjp_public_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def some_action
    gon.some_variable = some_value
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )

  rescue Payjp::PayjpError => e
    Rails.logger.error("PayjpError: #{e.message}")
    flash.clear
    flash[:error] = '購入処理に失敗しました。'
    redirect_to item_orders_path(@item)
  end

  def redirect_if_not_valid
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end
