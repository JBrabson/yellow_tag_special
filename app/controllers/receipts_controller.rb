class ReceiptsController < ApplicationController
  def index
    @weekly_items = Item.all
    @discounts = Discount.all
    @receipts = Receipt.all
  end

  def show
    receipt = Receipt.find(params[:id])
    @receipt = receipt.totals(receipt[:items_purchased])
    @counts = receipt.sort_items(receipt[:items_purchased])
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @receipt.save
    redirect_to "/receipts/#{@receipt.id}"
  end


  private
  def receipt_params
    params.permit(:items_purchased, :transaction_time)
  end
end
