require "rails_helper"

RSpec.describe "Favorite an Item" do
  it "can be favorited by clicking on link" do
    item = Item.create(name: "name", description: "description")

    visit items_path
    click_link_or_button("Add to Favorites")
  end
end
