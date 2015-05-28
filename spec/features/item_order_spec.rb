require 'rails_helper'

RSpec.describe "User Orders Item" do
  it "can visit the item show page to one-click order an item" do
    User.create(name: "name", email: "email")
    item = Item.create(name: "name", description: "description")
    visit item_path(item)

    click_link_or_button("Order Item")

    order = User.first.orders.last

    expect(page).to have_content("Order Success!")
    expect(current_path).to eq(order_path(order))

    [item.name, item.description].each do |item|
      expect(page).to have_content(item)
    end
  end
end
