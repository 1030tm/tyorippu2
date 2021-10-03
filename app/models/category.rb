class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '寺社' },
    { id: 2, name: '城' },
    { id: 3, name: 'レストラン・カフェ' },
    { id: 4, name: 'フォトスポット' },
    { id: 5, name: '図書館' },
    { id: 6, name: 'お店' },
    { id: 7, name: '博物館・美術館' },
    { id: 8, name: '海・プール' },
    { id: 9, name: '山' },
    { id: 10, name: '温泉・スパ' },
    { id: 11, name: '動植物園・水族館' },
    { id: 12, name: '道の駅・PA' },
    { id: 13, name: '公園' },
    { id: 14, name: 'プラネタリウム' },
    { id: 15, name: 'イベント・映画' }
  ]

  include ActiveHash::Associations
  has_many :spots
end
