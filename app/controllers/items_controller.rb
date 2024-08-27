class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)

    puts params[:item]
    if @item.save
      flash[:notice] = '商品が出品されました'
      redirect_to item_path(@item)
    else
      # デバッグ用にエラー内容をコンソールに出力
      puts @item.errors.full_messages
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :condition_id,
                                 :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :image)
  end
end
