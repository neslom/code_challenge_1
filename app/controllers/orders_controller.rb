class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.new(order_params)

    if order.save
      flash[:notice] = "Order Success!"
      redirect_to order_path(order)
    else
      redirect_to :back
    end
  end

  private

  def order_params
    params.require(:order).permit(:amount, :user_id)
  end
end
