require "rails_helper"

RSpec.describe "Favorite an Item" do
  xit "can be favorited by clicking on link", js: true do
    item = Item.create(name: "name", description: "description")
    expect(Favorite.count).to eq(0)

    visit items_path
    click_link_or_button("Add to Favorites")
    expect(Favorite.count).to eq(1)
  end
end
