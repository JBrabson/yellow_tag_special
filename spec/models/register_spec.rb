require 'rails_helper'

RSpec.describe Register, type: :model do
  describe 'relationships' do
    it {should belong_to(:item)}
    it {should belong_to(:receipt)}
  end
end
