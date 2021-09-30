FactoryBot.define do
  factory :page do
    page_title          { 'テスト' }
    page_comment        { 'テストコメント' }

    association :user
  end
end
