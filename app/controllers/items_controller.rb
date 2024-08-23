before_action :authenticate_user!, only: [:new, :create]

def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
end

private

def item_params
  params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
end

# item.rb
validates :name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :image, presence: true
validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

# new.html.erb
<%= form_with model: @item, local: true do |f| %>
  <%= render 'shared/error_messages', model: f.object %>
  <%= f.file_field :image %>
  <%= f.text_field :name %>
  <%= f.text_area :description %>
  <%= f.collection_select(:category_id, Category.all, :id, :name) %>
  <%= f.collection_select(:condition_id, Condition.all, :id, :name) %>
  <%= f.collection_select(:shipping_fee_id, ShippingFee.all, :id, :name) %>
  <%= f.collection_select(:prefecture_id, Prefecture.all, :id, :name) %>
  <%= f.collection_select(:scheduled_delivery_id, ScheduledDelivery.all, :id, :name) %>
  <%= f.number_field :price %>
  <%= f.submit "出品する" %>
<% end %>

# _error_messages.html.erb
<% if model.errors.any? %>
  <div id="error_explanation">
    <ul>
    <% model.errors.full_messages.each do |message| %>
      <li><%= message %></li>
    <% end %>
    </ul>
  </div>
<% end %>
