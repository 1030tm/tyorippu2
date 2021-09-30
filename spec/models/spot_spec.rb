require 'rails_helper'

RSpec.describe Spot, type: :model do
  before do
    @spot = FactoryBot.build(:spot)
  end

  describe 'スポット新規投稿' do
    context '新規投稿できるとき' do
      it '全ての項目が存在すれば投稿できる' do
        expect(@spot).to be_valid
      end
      it 'spot_telが空でもできる' do
        @spot.spot_tel = ''
        expect(@spot).to be_valid
      end
      it 'spot_commentが空でもできる' do
        @spot.spot_comment = ''
        expect(@spot).to be_valid
      end
    end
    context '新規投稿できないとき' do
      it 'spot_nameが空だとできない' do
        @spot.spot_name = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Spot name can't be blank")
      end
      it 'spot_addressが空だとできない' do
        @spot.spot_address = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Spot address can't be blank")
      end
      it 'pageと紐づいていないとできない' do
        page = FactoryBot.build(:page)
        @spot = FactoryBot.build(:spot, page_id: page.id)
        @spot.page_id = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Page must exist")
      end
    end
  end
end
