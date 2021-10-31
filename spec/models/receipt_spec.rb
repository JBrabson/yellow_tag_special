require 'rails_helper'

RSpec.describe Receipt, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:transaction_time)}
  end
  describe 'relationships' do
    it {should have_many(:registers)}
    it {should have_many(:items).through(:registers)}
  end
end
