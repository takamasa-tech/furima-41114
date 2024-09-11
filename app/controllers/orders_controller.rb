class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id]) # 商品情報のIDをもとに、その商品の情報を取得
    @order_form = OrderForm.new
  end

  def create
    item = Item.find(params[:item_id]) # 商品情報のIDをもとに、その商品の情報を取得
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPの秘密鍵を設定

    Payjp::Charge.create(
      amount: item.price, # 商品の価格
      card: params[:token], # クライアントから送られてきたトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )

    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :addresses, :house_number, :phone_number, :token).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
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
