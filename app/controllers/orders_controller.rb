class OrdersController < ApplicationController
  before_action :authenticate_user!:only: [:index, :create]
  before_action :set_item, only: [:index, :create, :edit]
  before_action :redirect_if_not_valid, only: [:index, :create]
  before_action :set_payjp_public_key, only: [:index, :new, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.process_order
      redirect_to root_path
    else
      render :index
    end
  end


  private

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
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :address, :house_number, :phone_number, :token).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
     amount: Item.find(params[:item_id]).price,
     card: order_params[:token],
     currency: 'jpy'
    )
  end
end
