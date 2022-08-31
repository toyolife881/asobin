class EstimatedTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '5分' },
    { id: 3, name: '15分' },
    { id: 4, name: '30分' },
    { id: 5, name: '45分' },
    { id: 6, name: '1時間以上' }
  ]

  include ActiveHash::Associations
  has_many :plays
  end