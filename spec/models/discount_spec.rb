require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:qty_required)}
    it {should validate_presence_of(:discounted_price)}
  end

  describe 'relationships' do
    it {should belong_to(:item)}
  end
end
