class PlayCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '室内遊び' },
    { id: 3, name: '外遊び' },
    { id: 4, name: '製作' },
    { id: 5, name: '音楽' },
    { id: 6, name: '本' },
    { id: 7, name: 'TVゲーム' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: '料理' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :plays
  end