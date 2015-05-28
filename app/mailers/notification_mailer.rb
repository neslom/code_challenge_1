class NotificationMailer < ActionMailer::Base
  default from: "markus@storedom.com"

  def notify_admin(order_id, user_id, item_id)
    @order_id = order_id
    @user = User.find_by(id: user_id)
    @item = Item.find_by(id: item_id)
    mail(to: "storedom-overlord@example.com", subject: "Order placed")
  end
end
