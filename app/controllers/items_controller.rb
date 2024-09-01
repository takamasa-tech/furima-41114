class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :check_user, only: [:edit, :update]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = '商品が出品されました'
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :condition_id,
                                 :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :image, :user_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
