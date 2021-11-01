class ReceiptsController < ApplicationController
  def index
    @weekly_items = Item.all
    @discounts = Discount.all
  end

  def show
    @receipt = Receipt.find(params[:id])
    binding.pry
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
