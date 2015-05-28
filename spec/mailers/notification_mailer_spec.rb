require "rails_helper"

RSpec.describe NotificationMailer, type: :mailer do
  it "sends an email to admin when an order is placed" do
    user = User.create(name: "name", email: "email")
    order = Order.create(user_id: user.id)
    item = Item.create(name: "name", description: "description")

    NotificationMailer.notify_admin(order.id, user.id, item.id)
    email = ActionMailer::Base.deliveries.last

    expect(email).not_to be_nil
    expect(email.to).to eq("storedom-overlord@example.com")
    expect(email.from).to eq("markus@storedom.com")
    expect(email.subject).to eq("Order placed")
  end
end
