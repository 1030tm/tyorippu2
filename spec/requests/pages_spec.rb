require 'rails_helper'

RSpec.describe "Pages", type: :request do
  before do
    @page = FactoryBot.create(:page)
  end

  describe "GET /pages" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのページのpage_titleが存在する" do
      get root_path
      expect(response.body).to include(@page.page_title)
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのページのpage_commentが存在する" do
      get root_path
      expect(response.body).to include(@page.page_comment)
    end
  end
end
