class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @items = Item.order("created_at DESC")
  end

  private

  def article_params
    params.require(:item).permit(:name, :description, :detail_id, :state_id, :sipping_cost_id, :prefecture_id, :selling_price_id, :user_id )
  end

end
