class ReceiptsController < ApplicationController
  def index
    @weekly_items = Item.all
    @discounts = Discount.all
  end
end
