class ItemsController < ApplicationController
  respond_to :json, :html

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id].to_i)
  end

  def favorite
    item = Item.find_by(id: params[:id])
    Favorite.find_or_create_by(item_id: item.id)
    respond_with item
  end

  def unfavorite
    item = Item.find_by(id: params[:id])
    Favorite.find_by(item_id: item.id).destroy
    respond_with item
  end
end
