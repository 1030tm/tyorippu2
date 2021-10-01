require 'rails_helper'

RSpec.describe Page, type: :model do
  before do
    @page = FactoryBot.build(:page)
  end

  describe 'ページ新規投稿' do
    context '新規投稿ができるとき' do
      it 'page_title,page_comment,user_idがあれば投稿できる' do
        expect(@page).to be_valid
      end
    end

    context '新規投稿ができないとき' do
      it 'page_titleが空だと投稿できない' do
        @page.page_title = ''
        @page.valid?
        expect(@page.errors.full_messages).to include("Page title can't be blank")
      end
      it 'userと紐づいていないと登録できない' do
        @page.user = nil
        @page.valid?
        expect(@page.errors.full_messages).to include('User must exist')
      end
    end
  end
end
