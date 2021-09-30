FactoryBot.define do
  factory :spot do
    spot_name             { 'テスト' }
    spot_address          { '東京都' }
    spot_tel              { '09012345678' }
    spot_parking          { 'なし' }
    spot_comment          { 'テストコメント' }

    association :page
  end
end
