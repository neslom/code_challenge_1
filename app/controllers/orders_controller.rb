class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(amount: params[:order][:amount], user_id: params[:order][:user_id])
    item = Item.find_by(id: params[:order][:item_id])
    @order.items << item

    if @order.save
      flash[:notice] = "Order Success!"
      NotificationMailer.notify_admin(@order.id, params[:order][:user_id], item.id)
      redirect_to order_path(@order)
    else
      redirect_to :back
    end
  end
end
